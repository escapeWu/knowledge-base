---
{"dg-publish":true,"permalink":"/01-frontend/vue/vue-keep-alive/","title":"vue keep-alive使用","tags":["vue","frontend"],"created":"2024-11-19T09:55:16.105+08:00","updated":"2024-12-04T09:23:29.690+08:00"}
---

#### ANKI-vue keep-alive是什么？ 有哪些知识点需要注意？
+ `<KeepAlive>` 是一个内置组件，它的功能是在多个组件间动态切换时缓存被移除的组件实例。
+ keepAlive 通常配合 component 动态组件 **实现组件实例的缓存**。
+ 缓存控制：
	+ 通过 max 来限制最大缓存的实例数量（背后参考了LRU算法）。
	```jsx
		<KeepAlive :max="10">
	```
	+ 通过 include 和 exclude 来决定哪些需要缓存(会匹配组件名称)
		```jsx
		// 数组 (需使用 `v-bind`)
		<KeepAlive :include="['a', 'b']">
		  <component :is="view" />
		</KeepAlive>
		// 以英文逗号分隔的字符串
		<KeepAlive include="a,b">
		  <component :is="view" />
		</KeepAlive>
		// 正则表达式 (需使用 `v-bind`) 
		<KeepAlive :include="/a|b/">
		  <component :is="view" />
		</KeepAlive>
		```
+ 生命周期：
	+ onActivated `/ˈaktɪveɪt/`：会在 首次挂载，每次从缓存中被重新插入时触发
	+ onDeactivated：从DOM上移除，被加入缓存。以及组件卸载时调用
ID: 1731982131618

