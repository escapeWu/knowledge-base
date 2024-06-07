---
{"dg-publish":true,"permalink":"/01-frontend/browser/web-worker/","title":"浏览器中web-worker 简单使用示例，及场景介绍","tags":["js","browser","web-worker"],"created":"2024-06-07T11:07:57.201+08:00","updated":"2024-06-07T16:12:49.704+08:00"}
---


#### ANKI-webworker 简单使用
https://stackblitz.com/edit/vitejs-vite-u7vrv5?file=src%2FApp.tsx
==worker.js==
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


#### webwoker 使用场景：图片打包压缩 TODO
[[01-frontend/utils/imglist - zip\|imglist - zip]]