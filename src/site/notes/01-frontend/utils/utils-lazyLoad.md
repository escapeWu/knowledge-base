---
{"dg-publish":true,"permalink":"/01-frontend/utils/utils-lazy-load/","title":"组件懒加载","tags":["js","frontend"],"created":"2024-10-25T11:28:42.000+08:00","updated":"2024-12-02T15:03:06.907+08:00"}
---

#### ANKI-懒加载如何做？
有个常见的需求，判断元素是否到达可使区域，进入后再触发逻辑执行。
判断网页是否到达可视区域，有如下几种方式：
`Intersection Observer API`：不阻塞主线程
```js
const observer = new IntersectionObserver((entries) => {
	entries.forEach(entry => {
		if (entry.isIntersecting) {
			console.log('元素进入可视区域')
		}
	})
})
//
const target = document.querySelector('#your-id')
observer.observe(target)
```
`getBoundingClientRect()`
```js
function isElementInViewport(el) {
	const rect = el.getBoundingClientRect()
	return (
		rect.top >= 0 &&
		rect.left >= 0 &&
		rect.bottom<= (window.innerHeight || document.documentElement.clientHeight) &&
		rect.right<= (window.innerWidth || document.documentElement.clientWidth)
	)
}
//
const element = document.querySelector('#your-id')
if (isElementInViewport(element)) {
	console.log("元素进入可视区域")
}
```
+ [react-懒加载组件-IntersectionObserver](https://stackblitz.com/~/github.com/escapeWu/lazyload?file=src/components/LazyCard.jsx)
+ 参考文章：[前端性能优化：图片懒加载](https://juejin.cn/post/7271639532469747769)
ID: 1729826922038

