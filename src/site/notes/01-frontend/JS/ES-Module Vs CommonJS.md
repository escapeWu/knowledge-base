---
{"dg-publish":true,"permalink":"/01-frontend/js/es-module-vs-common-js/","title":"ES Module 和 CommonJS 的区别","tags":["js","frontend"],"created":"2024-10-30T13:39:19.000+08:00","updated":"2024-12-02T14:55:09.129+08:00"}
---

#### ANKI-ES-Module 和 CommonJS的使用区别
外部使用区别
+ esmodule 导出的是引用，模块外部能够实时观察到模块内部的变化
+ CommonJS 导出的是值的拷贝，模块内部的变化不会影响外部
加载机制：
+ ES-module 文件编译时加载，异步加载，支持动态导入
	+ 得益于ESM的静态编译，打包工具比如 webpack 或vite 可以进行Tree Shaking，移除未使用的代码。但CommonJS通常无法实现
+ CommonJS 代码运行时加载，同步加载模块
使用场景：
+ CommonJS主要在NodeJS中使用，但可以通过 package.json 中 type: module 来使用ESM
+ 浏览器中，ESM原生支持，通过 `<script type="module" />`使用
+
ID: 1730965092001
