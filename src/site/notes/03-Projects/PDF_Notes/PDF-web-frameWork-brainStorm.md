---
{"dg-publish":true,"permalink":"/03-projects/pdf-notes/pdf-web-frame-work-brain-storm/","created":"2024-05-27T15:03:21.000+08:00","updated":"2024-05-27T15:03:21.000+08:00"}
---



计划实现类似marginNote的Web端应用。

pdf核心功能应该包括：

- [ ] highlight：高亮选中的div
- [ ] annotate：选中一段div，进行批注
- [ ] canvas脑图卡片

### 20240422记录：

使用react-pdf 先搭建一个简易的版本，慢慢迭代。第一个版本支持

+ 高亮选中区域（react-pdf 原生支持） 至于canvas 脑图卡片，考虑通过截图的方式实现。

##### 技术栈

###### 后端

使用现有的模板

+ spring boot 3, mybatis-plus, liquibase, sa-token

###### 前端

基础：

+ ~~Next.js (简化开发流程)~~
+ react：hook语法为主
+ ts
+ pnpm 状态管理：
+ react-redux OR tanStack Query
+ react  \[\[router\]\]

UI：

+ tailwindcss 必须引入的是tailwindcss，暂不确定要不要引入ant design 来减小工作量。所以暂时搁