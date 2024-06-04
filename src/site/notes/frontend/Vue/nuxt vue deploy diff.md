---
{"dg-publish":true,"permalink":"/frontend/vue/nuxt-vue-deploy-diff/","created":"2024-06-04T10:19:23.058+08:00","updated":"2024-06-04T11:05:07.658+08:00"}
---

其实想问，SSR（Server Side Render）和 SPA (Single Page Application) 部署的区别。

SSR 是全栈项目，当他执行npm run build 时候，会得到.nuxt 目录，它部署时候会启动一个nodejs 服务，用来做服务端渲染。而SPA 项目打包则会得到一个dist 静态资源包，使用nginx 进行部署。  