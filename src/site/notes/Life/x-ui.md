---
{"dg-publish":true,"permalink":"/life/x-ui/","created":"2024-05-27T15:37:32.383+08:00","updated":"2024-05-27T15:03:21.000+08:00"}
---

>写给自己看的x-ui快速配置流程

前置准备：
1. 托管在cloudflare上的域名
2. 一台能访问外网的vps（阿里云新加坡轻量服务器）

操作流程：
1. 在cloudflare 上指定域名的dns解析
2. 获取cloudflare 的 API_KEY
3. 运行x-ui 自动安装脚本:
	1. 仓库地址：`https://github.com/vaxilu/x-ui`
	2. 脚本: `bash <(curl -Ls https://raw.githubusercontent.com/vaxilu/x-ui/master/install.sh)`
4. 服务器上命令行输入x-ui，依次选择
	15. 一键安装 bbr (最新内核)
	16. 一键申请SSL证书(acme申请)
5. web端控制生成配置文件：
	1. ![Pasted image 20240508144853.png](/img/user/attachments/Pasted%20image%2020240508144853.png)

> 第一步第二步参考文档：https://www.duangvps.com/archives/1776
> 16步骤acme 生成的公钥私钥在 `~/.acme.sh/` 查看
> ![Pasted image 20240508145048.png](/img/user/attachments/Pasted%20image%2020240508145048.png)
> 