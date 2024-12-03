---
{"dg-publish":true,"permalink":"/01-frontend/react/react-router-basic/","title":"React Router 基础","created":"2024-11-07T15:42:50.685+08:00","updated":"2024-11-11T10:11:24.000+08:00"}
---

#### ANKI-React Router 中 路由有哪几种模式
+ BrowserRouter：使用History API（pushState，replaceState，popState）来保持UI和URL同步。
+ HashRouter：使用URL 的hash部分（window.location.hash）来保持UI和URL同步，主要用于兼容不支持HTML5 history API的浏览器
+ MemoryRouter：保持内存中的一个non-URL 路径历史记录，经常在测试和非浏览器环境（React Native 中使用）
ID: 1731291082791

