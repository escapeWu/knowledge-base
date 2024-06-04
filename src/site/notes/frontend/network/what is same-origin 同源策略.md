---
{"dg-publish":true,"permalink":"/frontend/network/what-is-same-origin/","created":"2024-05-27T15:04:11.000+08:00","updated":"2024-06-04T10:14:53.608+08:00"}
---

#### ANKI-同源策略的定义
同源策略（Same-Origin Policy，简称SOP）是Web浏览器的一项重要安全机制，用于防止不同来源的资源之间的交互，从而保护用户的数据安全和隐私。
==定义==
同源策略规定，只有当两个URL的==协议（protocol）、主机（host）和端口（port）==都相同时，它们才被认为是同源的。只有同源的网页才能互相访问其内容和数据。
==例如==
- `http://www.example.com/page1` 和 `http://www.example.com/page2` 是同源的，因为它们的协议、主机和端口都相同。
- `http://www.example.com` 和 `https://www.example.com` 不是同源的，因为它们的协议不同。
- `http://www.example.com` 和 `http://api.example.com` 不是同源的，因为它们的主机不同。
- `http://www.example.com:80` 和 `http://www.example.com:8080` 不是同源的，因为它们的端口不同。
==作用==
同源策略主要用于以下几个方面：
1. **防止跨站脚本攻击（XSS）：** 阻止恶意网站读取或操作其他网站的敏感数据。
2. **保护用户隐私：** 防止未经授权的页面访问用户的会话信息、Cookies等。
3. **数据隔离：** 确保一个站点的数据不会被其他站点随意访问和篡改。
==例外==
虽然同源策略是Web安全的基石，但有时也需要跨域资源共享。为了应对这种情况，以下是一些常见的解决方法：
1. **跨域资源共享（CORS）：** 通过服务器设置允许特定的跨域请求。
2. **JSONP:** 一种通过动态插入`<script>`标签来实现跨域请求的技术，但仅支持GET请求。
3. **服务器代理:** 通过服务器端代理请求来绕过同源策略限制。
阮一峰：[浏览器同源政策及其规避方法](https://www.ruanyifeng.com/blog/2016/04/same-origin-policy.html)
ID: 1717062266329

#### ANKI-如何借助cookie， iframe实现跨域信息共享
Cookie 是服务器写入浏览器的一小段信息，只有同源的网页才能共享。但是，两个网页==一级域名相同，只是二级域名不同==，浏览器允许通过设置`document.domain`共享 Cookie。
iframe 也是相同操作
ID: 1717382227066


#### ANKI-什么是postMessage？
跨文档通信 API（Cross-document messaging）为`window`对象新增了一个`window.postMessage`方法，==允许跨窗口通信，不论这两个窗口是否同源==。
流程：
+ 父页面 `window.open`打开 `childwindow`，通过 `childwindow.postMessage`发送消息。
+ 子页面 通过 `eventListener ‘message’` 接收，通过 `window.opener.postMessage` 可实现对任意页面的消息发送
```js
// 父页面
const childWindow = window.open('https://example.com/child.html', 'childWindow', 'width=600,height=400');
// 发送消息
document.getElementById('sendMessage').addEventListener('click', () => {
	if (childWindow) {
		childWindow.postMessage('Hello from parent!', 'https://example.com');
	}
});
// 接收消息
window.addEventListener('message', (event) => {
	if (event.origin === 'https://example.com') {
		console.log('Received from child:', event.data);
	}
});
// 子页面 example.com
// 接收消息
window.addEventListener('message', (event) => {
	if (event.origin === 'https://parent.com') {
		console.log('Received from parent:', event.data);
	}
});
// 发送消息
document.getElementById('sendMessage').addEventListener('click', () => {
	window.opener.postMessage('Hello from child!', 'https://parent.com');
});
```
+ childWindow.postMessage('Hello from parent!', 'https://example.com');  parent send
+ window.opener.postMessage('Hello from child!', 'https://parent.com');  chid send
ID: 1717382227070
