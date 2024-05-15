---
{"dg-publish":true,"permalink":"/frontend/react/what-are-react-server-components-rs-cs/","created":"2024-05-15T09:59:36.400+08:00","updated":"2024-05-15T10:49:14.174+08:00"}
---

本文是 [What are React Server Components](https://unicorn-utterances.com/posts/what-are-react-server-components) 的翻译


在这个系列的上篇文章，我们讨论了 React 中SSR 的流程。

我在2020年写过一篇文章。在这个时间点，使用React 做SSR有性能缺陷，在服务端以及客户端会有双倍的性能消耗

在那个时间点的Next.js 或者其他的React SSR 方案只有一种实现方式：
1. 在Server 端渲染VDOM
2. 根据Server端的VDOM生成HTML
3. 将HTML 和所有的React代码发送到 Client
4. 在Client 重新完整生成 VDOM
5. 销毁旧的DOM，根据新的 Client VDOM 重新生成所有的组件
![Pasted image 20240515100919.png](/img/user/attachments/Pasted%20image%2020240515100919.png)
上述流程被称为 ==Hydration==。 如果你的网站静态页面较多(绝大多数页面理论上可以复用)，那么==Hydration==会产生无意义的性能损耗。当初这个情况，对于React开发团队来说是个急需解决的严重问题。

在2020年的那篇文章发布的下半年（2020.09），他们有了答案：[React Server Components](https://legacy.reactjs.org/blog/2020/12/21/data-fetching-with-react-server-components.html).

## 什么是React Server Component(RSC)

简而言之, RSC 允许你指定哪些React组件在服务端做渲染，哪些组件在客户端做渲染。

这个操作通过一个特殊语法实现，并且在正确实现时，允许使用特殊的服务器专用数据加载模式。
> This is done using a special syntax in your components and allows for special server-only data loading patterns when implemented properly

举个例子
```jsx
function App() {
	return <>
		{/* Render parts on the client */}
		<Header/>
		{/* Render all of it on the client */}
		<Dashboard/>
		{/* Render all of it on the server */}
		<Footer/>
	</>
}
```
这段代码的执行流程如下：
![Pasted image 20240515102059.png](/img/user/attachments/Pasted%20image%2020240515102059.png)
`<ProfilePicture>`, `<Dashboard/>`以及他们的子组件将会在 Client 重新初始化
`<Footer> <Header>` 不会在客户端初始化

> 请注意，==默认情况下，Client组件仍将在服务器上预生成 HTML==。不同之处在于，Client的重新初始化现在由在服务器上构建的虚拟 DOM (VDOM) 提供信息，从而大幅减少所需的执行量。


## 什么是 `"use client"`

在 RSC中，`"use client"` 字符串可设置在文件或者函数的顶部，告诉React这个组件应该在Client 渲染。在客户端渲染允许你使用 state 并进行响应式 rerender。不指定"use client"，那么这个组件会被当作服务端组件处理

让我们使用 "use client" 语法来实现上述流程的例子：
```jsx
// page.jsx
import {ProfilePicture, Dashboard} from "./client-components"
export function App() {
	return <>
		<Header/>
		<Dashboard/>
		<Footer/>
	</>
}
function Footer() {
	// ...
}
function Header() {
	return (
		<>
			<SearchBar/>
			<ProfilePicture/>
		</>
	)
}
function SearchBar() {
	// ...
}
```

```jsx
"use client"
// client-components.jsx
export function Dashboard() {
	return (
		<Chart/>
	)
}
function Chart() {
	// ...
}
export function profilePicture() {
	// ...
}
```

## 服务端组件的局限

因为服务端组件完全在服务端执行，有如下局限：
+ 不能使用 包括了 Client state 的 React Hook（useState, useReducer,等）
+ 不能使用 `<Context.Provider>`
+ 不能使用 浏览器API （localStorage，querySelector）
+ 不能将如下属性 从一个服务端组件通过props 传递给客户端组件
	+ React Element `component={<Component/>}` or `component={Component}`
	+  Functions ( Server Action除外 - 后续会讲)
	+ 类
	+ 类的实例
	+ 自定义的Symbols
+ 服务端组件不能在客户端组件内部被调用
	+ 不允许
	+ ![Pasted image 20240515104654.png](/img/user/attachments/Pasted%20image%2020240515104654.png)
	+ 允许
	+ ![Pasted image 20240515104716.png](/img/user/attachments/Pasted%20image%2020240515104716.png)

