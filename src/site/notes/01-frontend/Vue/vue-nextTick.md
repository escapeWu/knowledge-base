---
{"dg-publish":true,"permalink":"/01-frontend/vue/vue-next-tick/","created":"2024-09-18T14:20:17.858+08:00","updated":"2024-10-10T13:19:15.449+08:00"}
---

#### ANKI-什么是nextTick
`nextTick` 是 Vue.js 提供的一个全局 API，用于在下次 DOM 更新循环结束之后执行延迟回调。
**这个api有什么实际使用场景？**
Vue异步执行DOM更新。只要观察到数据变化，Vue将开启一个队列，并缓冲在同一事件循环中发生的所有数据改变。如果同一个watcher被多次触发，只会被推入到队列中一次。这种在缓冲时去除重复数据对于避免不必要的计算和DOM操作上非常重要。然后，在下一个的事件循环“tick”中，Vue刷新队列并执行实际 (已去重的) 工作
```js
// watcher.js
// 当依赖发生变化时，触发更新
update() {
  if(this.lazy) {
    // 懒执行会走这里, 比如computed
    this.dirty = true
  }else if(this.sync) {
    // 同步执行会走这里，比如this.$watch() 或watch选项，传递一个sync配置{sync: true}
    this.run()
  }else {
    // 将当前watcher放入watcher队列， 一般都是走这里
    queueWatcher(this)
  }
}
// 更多详细源码相关分析看这里：https://juejin.cn/post/7089980191329484830
```
==我们在修改 双向绑定的数据后，立即获取dom并不是最新的借助nextTick，我们可以保证每次都能获取最新的dom==
**你说的tick是什么？**
tick是自定义的触发时机，用来决定虚拟DOM什么时候更新。
vue使用eventloop 来管理这个时机。nextTick 有降级策略，防止过旧的浏览器不支持新特性：
优先级从高到低依次是： MutationObserver >  Promise > setImmediate > setTimeout。
**使用示例**
```javascript
this.message = 'Hello, Vue!';
this.$nextTick(() => {
  // DOM 更新完成，可以安全地操作 DOM
  console.log(this.$refs.messageElement.textContent); // 'Hello, Vue!'
});
```
ID: 1717234530435

