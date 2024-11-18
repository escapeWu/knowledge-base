---
{"dg-publish":true,"permalink":"/01-frontend/browser/web-worker/","title":"浏览器中web-worker 简单使用示例，及场景介绍","tags":["js","browser","web-worker"],"created":"2024-10-23T10:49:57.000+08:00","updated":"2024-10-23T10:49:57.000+08:00"}
---


#### ANKI-webworker 简单使用
https://stackblitz.com/edit/vitejs-vite-u7vrv5?file=src%2FApp.tsx
==public/worker.js==
```js
function fib(num) {
  console.log('fib', num);
  if (num <= 1) return num;
  return fib(num - 1) + fib(num - 2);
}
// 监听主线程的消息
onmessage = function (event) {
  const n = event.data;
  const result = fib(n);
  console.log('result', result);
  postMessage(result);
};
```
==使用-react==
使用promise 包装成异步函数方便调用
```js
const worker = new Worker('/worker.js');
// 封装 Web Worker 调用成 Promise
function calculateFibonacci(n: number): Promise<number> {
  return new Promise((resolve, reject) => {
    worker.postMessage(n);
    worker.onmessage = (event) => {
      resolve(event.data);
    };
    worker.onerror = (error) => {
      reject(error);
    };
  });
}
calculateFibonacci(count)
  .then((result) => {
	console.log(result)
  })
```
ID: 1717729489020


#### ANKI-webwoker 使用场景：文件打包压缩
简化场景：本地上传文件，压缩为zip后下载。压缩操作占用性能，使用webworker 单独处理
![Pasted image 20241010180106.png](/img/user/attachments/Pasted%20image%2020241010180106.png)
+ [github-常规版本](https://stackblitz.com/~/github.com/escapeWu/webworker-imgs2zip/tree/main?file=src/App.tsx)
+ [github-webworker](https://stackblitz.com/~/github.com/escapeWu/webworker-imgs2zip/tree/feat-webwork?file=src/App.tsx)
+ https://v3.vitejs.dev/guide/features.html#import-with-query-suffixes
ID: 1728616667403
