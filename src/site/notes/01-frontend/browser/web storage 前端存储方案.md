---
{"dg-publish":true,"permalink":"/01-frontend/browser/web-storage/","created":"2024-05-29T23:33:13.000+08:00","updated":"2024-06-04T11:12:11.752+08:00"}
---


#### ANKI-web存储的可选方案

| 名称                                          | 存储空间      | 有效期       | **存放位置** | 作用域                    |
| ------------------------------------------- | --------- | --------- | -------- | ---------------------- |
| Cookie                                      | 4kb       | 支持自定义     | 浏览器缓存    | 同源限制                   |
| sessionStorage                              | 5M        | 浏览器窗口关闭之前 | 本地保存     | ==即使同源，不同的浏览器窗口中也不共享== |
| localStorage                                | 5M        | 始终有效      | 本地保存     | 同源限制                   |
| indexedDB - [[01-frontend/utils/IndexedDB_CRUD\|IndexedDB_CRUD]] | 50%本地磁盘空间 | 始终有效      | 本地保存     | 同源限制                   |
> 同源的概念: [[01-frontend/network/same-origin related\|same-origin related]]
ID: 1716996349486



