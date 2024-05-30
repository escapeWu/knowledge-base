---
{"dg-publish":true,"permalink":"/frontend/js/debounce-and-throttle/","created":"2024-05-29T23:33:13.000+08:00","updated":"2024-05-30T15:15:37.554+08:00"}
---



#### ANKI-debounce
debounce 函数返回一个可执行函数。这个可执行函数的作用域链上保存了定时器变量。当重复执行的时候，会先清空掉上次生成的定时器，从而实现延迟执行的效果
```js
function debounce(func, wait) {
  let timer = null;
  return function (...args) {
    clearTimeout(timer);
    timer = setTimeout(() => {
      func.apply(this, args);
    }, wait);
  };
}
```
ID: 1716996349466





#### ANKI-throttle
**timestamp 方式**
原理与 防抖函数相同，通过 closure 存储上次执行的时间戳，当前时间戳和之前的时间戳相比较，如果超过约定时间，则执行一次函数。
```js
// 只有当上一次调用的时间 与 现在时间的差值 超过了设定的时间 才会再次调用
function throttle(func, interval) {
  let lastTimeStamp = 0;
  let timer = null
  return function (...args) {
    clearTimeout(timer);
    let curDate = Date.now();
    const diff = curDate - lastTimeStamp;
    if (curDate - lastTimeStamp > interval) {
      func.apply(this, args);
      lastTimeStamp = curDate;
    } else {
      timer = setTimeout(() => {
        func.apply(this, args)
      }, interval)
    }
  };
}
```
**requestAnimationFrame方式**
实现原理和时间戳实现方法相同，只不过吧延迟 interval 替换为一帧。在屏幕刷新率为 60HZ 的情况下约为 16.7ms 执行一次（1000ms / 60 = 16.666...ms）
```js
function rafThrottle(func) {
  let lock = false;
  return function (...args) {
    if (lock) return;
    lock = true;
    window.requestAnimationFrame(() => {
      func.apply(this, args);
      lock = false;
    });
  };
}
```
ID: 1716996349468


