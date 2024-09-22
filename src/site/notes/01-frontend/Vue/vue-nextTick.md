---
{"dg-publish":true,"permalink":"/01-frontend/vue/vue-next-tick/","created":"2024-06-17T10:23:14.440+08:00","updated":"2024-06-17T10:22:26.000+08:00"}
---

#### ANKI-什么是nextTick
`nextTick` 是 Vue.js 提供的一个全局 API，用于在下次 DOM 更新循环结束之后执行延迟回调。
==使用示例==
```javascript
this.message = 'Hello, Vue!';
this.$nextTick(() => {
  // DOM 更新完成，可以安全地操作 DOM
  console.log(this.$refs.messageElement.textContent); // 'Hello, Vue!'
});
```
==实现原理==
nextTick 的原理，用一句话总结就是『利用  [[01-frontend/JS/eventLoop\|eventLoop]] 事件线程去异步操作』。本质上就是注册异步任务来对任务进行处理。不同的是，在 Vue 的不同版本对这个异步任务的优雅降级不太一样。
//
在 Vue 中，`nextTick` 优先使用微任务来实现，如果微任务不可用，则会降级使用宏任务。
==详细说明：==
当你在 Vue 中更改响应式状态时，最终的 DOM 更新并不是同步生效的，而是由 Vue 将它们缓存在一个队列中，直到下一个“tick”才一起执行。这样是为了确保每个组件无论发生多少状态改变，都仅执行一次更新。
ID: 1717234530435

