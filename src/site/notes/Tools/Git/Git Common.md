---
{"dg-publish":true,"permalink":"/tools/git/git-common/","created":"2024-01-16T13:51:35.541+08:00","updated":"2024-01-16T17:58:06.711+08:00"}
---


## 杂项

Github Token使用：
1. 在[此处](https://github.com/settings/tokens/new?scopes=repo)申请Github Token
2. git clone `https://`==token名称==@仓库地址。比如：`git clone https://asdasd@github.com/shancwovo/my-digital-garden.git`

### 仓库源操作
+ git remote -v: 查看配置的源地址
+ git remote set-url `origin-name` `origin-url`： 更换某个源的地址