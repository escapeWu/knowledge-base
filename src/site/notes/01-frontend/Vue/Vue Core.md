---
{"dg-publish":true,"permalink":"/01-frontend/vue/vue-core/","title":"Vue 深入知识点","created":"2024-11-11T13:50:45.699+08:00","updated":"2024-11-13T14:55:18.205+08:00"}
---

#### ANKI-TODO 实现一个简易的DOM Diff

#### ANKI-如何对项目进行SEO（Search Engine Optimization 搜索引擎优化）
1. 使用Meta标签，描述你的网页 `<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />`
	1. content type
	2. titile：搜索者显示的标题
	3. description：描述
2. 启用Https，搜索引擎偏向于优先推送https的网页结果
3. 启用站点地图：告诉爬虫你网站的结构
4. 框架适配：
	1.  [使用SSR框架](https://cn.vuejs.org/guide/scaling-up/ssr#why-ssr)。因为它会在服务器上生成HTML。
	2. 使用预渲染插件：
		1. webpack: [**prerender-spa-plugin**](https://github.com/chrisvfritz/prerender-spa-plugin) - webpack plugin，会将所有页面渲染成静态页面放在服务器上
		2. vite: [vite-plugin-ssr/plugin](https://vite-plugin-ssr.com/pre-rendering#how-to-pre-render) - 启用后，执行vite-build 会在 dist/client 目录下生成html 文件
5. 使用语义化标签：[HTML中新增的语义标签](https://www.runoob.com/html/html5-semantic-elements.html)![Pasted image 20241111141216.png](/img/user/attachments/Pasted%20image%2020241111141216.png) 
ID: 1731305545187

#### ANKI-Vue为什么要使用Proxy代替Object.defineProperty
Object.defineProperty缺点：
1. 无法检测数组变化：比如push, pop, shift, unshift,
	1. vue2对无法监听的部分做了重写，实现了push pop shift unshift splice sort reverse的监听
2. 无法检测对象的新增删除
	1. vue2 提供 $set方式来处理
ID: 1731480918186
