---
{"dg-publish":true,"permalink":"/06-tools/nignx/acme-sh-auto-cert/","title":"使用acme.sh，域名自动证书更新","created":"2024-11-27T15:08:36.874+08:00","updated":"2024-11-27T16:13:45.684+08:00"}
---

>我们目标是对 泛域名 增加Https的支持，以 `*.dev.hithinksoft.com`为例，并使用了阿里云dns

首先假设我们 nginx 安装完毕，现在要补充443 ssl 认证。流程如下：
1. 安装acme.sh
2. 使用dns api的形式 生成证书（全自动，只需要提供 你的api key 和 secret）
3. 复制证书到nginx 的 ssl目录（此目录可选，你要是愿意，nginx 可以直接指向外部的地址，但此文章不会这么干）
4. 配置nginx.conf，增加ssl相关配置代码

### 1. 安装acme.sh
==注意修改下email==，不改也行。 
```bash
curl https://get.acme.sh | sh -s email=my@example.com
// OR
wget -O -  https://get.acme.sh | sh -s email=my@example.com
```

### 2. dns api 模式，生成证书
https://github.com/acmesh-official/acme.sh/wiki/dnsapi#11-use-aliyun-domain-api-to-automatically-issue-cert
以aliyun 为例，你需要修改 `~/.bashrc`(或者你自定义的文件,如 `.zshrc`)，增加 api key, api secret
+ `vim ~/.bashrc`并底部增加如下配置（修改为自己的key secret）
	```bash
	// ~/.bashrc 文件
	export Ali_Key="LTAI5tsssQf"
	export Ali_Secret="pS4c3wCsssJL"
	```
+ `source ~/.bashrc`：生效配置
+ 对想用的证书进行生成（注意`''`包裹域名）:
	`acme.sh --issue --dns dns_ali -d '*.dev.hithinksoft.com'`
### 3. 复制证书到指定目录
我希望将证书复制到 ~/master-proxy/cert 目录，操作如下（注意`''`包裹域名）：
```bash
acme.sh --install-cert -d '*.dev.hithinksoft.com' \
--key-file        ~/master-proxy/cert/key.pem  \
--fullchain-file  ~/master-proxy/cert/cert.pem \
--reloadcmd     "service nginx reload"
```
### 4. 设置ssl 配置
进入 `/etc/nginx/conf.d`目录，增加一个文件，如 `dev.hithinksoft.com`
`vim dev.hithinksoft.com`
```python
server {
    listen 80;
    server_name ~^.*\.dev\.hithinksoft\.com$;

    # 强制将 HTTP 重定向到 HTTPS
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name ~^.*\.dev\.hithinksoft\.com$;

    # SSL 证书配置
    ssl_certificate     /root/master-proxy/cert/cert.pem;
    ssl_certificate_key /root/master-proxy/cert/key.pem;
	
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_prefer_server_ciphers on;
    ssl_ciphers HIGH:!aNULL:!MD5;
	# proxy
    location / {
        proxy_pass https://slave_nginx;
        proxy_ssl_server_name on;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_http_version 1.1;
        proxy_set_header Connection ""; # 支持长连接
    }
}
```