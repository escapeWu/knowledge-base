---
{"dg-publish":true,"permalink":"/frontend/browser/web-storage/","created":"2024-04-03T10:25:54.000+08:00","updated":"2024-04-03T10:25:54.000+08:00"}
---

| 名称 | 存储空间 | 有效期 | **存放位置** | 作用域 |
| ---- | ---- | ---- | ---- | ---- |
| Cookie | 4kb | 支持自定义 | 浏览器缓存 | 同源限制 |
| sessionStorage | 5M | 浏览器窗口关闭之前 | 本地保存 | ==即使同一页面，不同的浏览器窗口中也不共享== |
| localStorage | 5M | 始终有效 | 本地保存 | 同源限制 |
| indexedDB - [[frontend/utils/utils - IndexedDB CRUD 简单封装\|utils - IndexedDB CRUD 简单封装]] | 50%本地磁盘空间 | 始终有效 | 本地保存 | 同源限制 |
> 同源的概念: [[frontend/network/what is same-origin 同源策略\|what is same-origin 同源策略]]

