---
{"dg-publish":true,"permalink":"/01-frontend/js/event-loop/","title":"js中事件循环是什么？","tags":["js","frontend"],"created":"2024-08-07T13:25:40.000+08:00","updated":"2024-12-02T14:55:25.859+08:00"}
---

#js
#### ANKI-Event Loop 是什么？
在日常网页浏览中，浏览器会有多个线程同时工作，如：
- 1.GUI渲染**线程**
	- 负责渲染浏览器界面，解析HTML，CSS，构建DOM树和RenderObject树，布局和绘制等
- 2.JS引擎**线程**
	- 在 chrome 浏览器和 nodejs 里都是用 V8 引擎解析和运行 JS 代码。和GUI线程互斥
- 3.事件触发**线程**
	- 用来控制事件循环,当一个事件被触发时该线程会把事件添加到待处理队列的队尾，等待 JS 引擎的处理
- 4.定时触发**器线程**
	- 用于`setTimeout / setInterval`等的计时；
	+ 时间到，则通知**事件触发线程**，将定时器对应的任务放入Js引擎的任务队列；
	+  HTML标准中要求，低于4ms的定时，时间间隔都算作4ms（也就是定时器最低时间间隔为4ms）。
- 5.异步http请求**线程**
==Event Loop 实际上就是一个 job，用来检测 Call Stack 和 Callback Queue，一旦 Call Stack 里代码执行完以后，就会把 Callback Queue 里第一个 callback 函数放到 Call Stack 里执行。==
![Pasted image 20240703165901.png](/img/user/attachments/Pasted%20image%2020240703165901.png)
任务分类
- **宏任务（Macro Task）**: 包括 `setTimeout`, `setInterval`, I/O 操作等。
- **微任务（Micro Task）**: 包括 `Promise` 回调, `MutationObserver` 回调等。
执行顺序
- 执行一个宏任务（栈中没有就从事件队列中获取）
- 执行过程中如果遇到微任务，就将它添加到微任务的任务队列中
- 宏任务执行完毕后，立即执行当前微任务队列中的所有微任务（依次执行）
- 当前宏任务执行完毕，开始检查渲染，然后GUI线程接管渲染
- 渲染完毕后，JS线程继续接管，开始下一个宏任务（从事件队列中获取，也就是 callbacke queue）
示例
```javascript
console.log('Start');
setTimeout(() => {
  console.log('setTimeout');
}, 0);
Promise.resolve().then(() => {
  console.log('Promise then');
});
console.log('End');
```
输出结果：
```
Start
End
Promise then
setTimeout
```
总结
Event Loop 是JavaScript处理异步编程的基础机制，通过协调宏任务和微任务，确保异步操作能够在单线程环境中高效执行。理解事件循环的工作原理对于编写高效和健壮的JavaScript代码至关重要。
![Pasted image 20240703165940.png](/img/user/attachments/Pasted%20image%2020240703165940.png)
ID: 1716996349473
