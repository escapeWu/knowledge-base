---
{"dg-publish":true,"permalink":"/frontend/utils/utils-create-limit-promise-promise/","created":"2024-01-19T16:07:11.496+08:00","updated":"2024-01-18T13:09:42.000+08:00"}
---

#frontend #utils

调用参考：
```ts
let asyncLoadFnList = paramsList.map(params => () => yourHttpRequest(params))
createLimitPromiseV2(2, asyncLoadFnList, 4)
	.then((resList) => '在此处理你的返回值')
```

这个函数实现了 多个http request（基于promise）的并发处理。
+ request参数如下：
	+ size：可同时触发的http request数量
	+ tobeExecuteAsyncFnList：等待执行的异步函数数组
	+ retryTime：如果某一个http request 失败了，重试的次数
+ response：
	+ `Array[成功response｜失败error]`

```ts
// promise 并发控制  
function createLimitPromise(size, tobeExecuteAsyncFnList, retryTime = 3) {  
  const innerRequests = tobeExecuteAsyncFnList.map(request => ({  
    requestStatus: 'NOT_START', // PENDING RESOLVE REJECT  
    success: false,  
    executeCount: 0,  
    request,  
    response: null  
  }));  
  return new Promise(resolve => {  
    //并发执行limitNum 次  
    for (let i = 1; i <= size; i++) {  
      run();  
    }  
    function run() {  
      const requestItem = getNextRequest(innerRequests);  
      if(!requestItem) return;  
      doFetch(requestItem).then(() => {  
        // 所有请求处理完毕后（包括失败的请求），获取response，并返回。此处可自行修改
        if(getProcessedRequestNum(innerRequests) === innerRequests.length) {  
          resolve(innerRequests.map(item => item.response))  
        }  
        run()  
      });  
    }  
    //没有触发过请求 或者 重试小于3次  
    function getNextRequest(innerRequests, retryTime = 3) {  
      return innerRequests.find(request => {  
        return isNotStart(request) || shouldRetry(request, retryTime)  
      })  
    }  
    function getProcessedRequestNum(innerRequests) {  
      return innerRequests.reduce((acc, cur) => {  
        // REJECT && 超过重试次数  
        const failed = cur.requestStatus === 'REJECT' && cur.executeCount >= retryTime  
        // 成功  
        const success = cur.requestStatus === 'RESOLVE'  
        return acc + ((failed || success) ? 1 : 0)  
      }, 0)  
    }  
    function shouldRetry(request) {  
      return request.requestStatus === 'REJECT' && request.executeCount < retryTime  
    }  
    function isNotStart(request) {  
      return request.requestStatus === 'NOT_START'  
    }  
    function doFetch(requestItem) {  
      if (!requestItem) return Promise.resolve();  
      requestItem.requestStatus = 'PENDING'  
      return requestItem.request().then(res => {  
        requestItem.response = res  
        requestItem.success = true  
        requestItem.requestStatus = 'RESOLVE'  
      }).catch(e => {  
        requestItem.success = false  
        requestItem.response = e  
        requestItem.requestStatus = 'REJECT'  
        console.error(`async request failed, remain retry ${retryTime - requestItem.executeCount}`)  
        console.error(requestItem.request)  
      }).finally(() => {  
        requestItem.executeCount += 1  
      })  
    }  
  });  
}
```