---
{"dg-publish":true,"permalink":"/tools/git/git-common/","created":"2024-04-10T17:36:40.000+08:00","updated":"2024-04-10T17:36:40.000+08:00"}
---


## 杂项

Github Token使用：
1. 在[此处](https://github.com/settings/tokens/new?scopes=repo)申请Github Token
2. git clone `https://`==token名称==@仓库地址。比如：`git clone https://asdasd@github.com/shancwovo/my-digital-garden.git`

### 仓库源操作
+ git remote -v: 查看配置的源地址
+ git remote set-url `origin-name` `origin-url`： 更换某个源的地址
+ git clone -b branch_name repository_url  git clone指定分支


### git 删除本地cache
![Pasted image 20240125152649.png](/img/user/attachments/Pasted%20image%2020240125152649.png)
git rm --cached .idea

## 自建gitlab clone 时候提示  SSL certificate problem: unable to get local issuer certificate

`git config --global http.sslVerify false`