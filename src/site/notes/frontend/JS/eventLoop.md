---
{"dg-publish":true,"permalink":"/frontend/js/event-loop/","created":"2024-05-29T23:33:13.000+08:00","updated":"2024-05-30T15:03:10.591+08:00"}
---

334
#### ANKI-Event Loop 是什么？

Event Loop（事件循环）是JavaScript中的一个核心机制，用于管理和协调异步操作，使得JavaScript在==单线程环境中能够高效地处理多个任务==。通过事件循环，JavaScript能够执行异步代码而不会阻塞主线程。
核心概念
1. **单线程模型**: JavaScript在单线程环境中执行代码，即在某一时刻只能执行一个任务。
2. **调用栈（Call Stack）**: 存储当前执行的代码上下文，每当一个函数被调用时，它的执行上下文会被压入调用栈，执行完毕后会从栈顶弹出。
3. **任务队列（Task Queue）**: 存储待执行的回调函数，这些回调函数通常是异步操作完成后的回调。
任务分类
- **宏任务（Macro Task）**: 包括 `setTimeout`, `setInterval`, I/O 操作等。
- **微任务（Micro Task）**: 包括 `Promise` 回调, `MutationObserver` 回调等。
执行顺序
1. **执行全局上下文中的同步代码**，这些代码会直接进入调用栈中执行。
2. **执行当前宏任务**（如 `setTimeout` 回调）。
3. **执行所有微任务**，在当前宏任务执行完后，事件循环会检查微任务队列并执行所有的微任务，直到微任务队列为空。
4. **渲染更新**（在浏览器环境中），如果有UI更新，浏览器会进行渲染。
5. **开始下一个宏任务**，事件循环会从宏任务队列中取出下一个任务并执行。
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
![Pasted image 20240229111922.png](/img/user/attachments/Pasted%20image%2020240229111922.png)
ID: 1716996349473
