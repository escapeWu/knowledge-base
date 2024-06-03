---
{"dg-publish":true,"permalink":"/backend/db/liquibase-lock/","created":"2024-05-27T15:39:28.236+08:00","updated":"2024-05-27T15:04:09.000+08:00"}
---

当处于表设计阶段，liquibase 表设计有问题，需要更新为最新表结构。可以通过如下方式处理：
1. 通过dbeaver 之类的数据库GUI工具，找到 DATABASECHANGELOG表，删除表对应的行，比如
![Pasted image 20240313132117.png](/img/user/attachments/Pasted%20image%2020240313132117.png)
2. 删除数据库中对应的表
