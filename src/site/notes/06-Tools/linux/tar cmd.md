---
{"dg-publish":true,"permalink":"/06-tools/linux/tar-cmd/","title":"文件传输相关","created":"2024-11-21T10:59:24.321+08:00","updated":"2024-11-22T10:57:27.516+08:00"}
---

#### ANKI-tar文件压缩解压缩指令
tar -czvf 压缩文件名.tar.gz 需要压缩的文件夹名
+ -c（create） 指定压缩文件名
+ -z（gzip）：指定压缩格式 gzip
+ -v（verbose）：显示压缩过程
+ -f（file）：待压缩的文件名称
配合 scp 指令，可以实现将服务器的文件下载到本地，假设目标文件夹为 `afolder`, 压缩文件为 `afolder.tar.gz`,传输到本地的 `~/downloads`目录下：
1. tar -czvf afolder.tar.gz afolder
2. scp `root@server.ip` ~/downloads
解压缩：
tar -xzvf afoder.tar.gz
+ x(extract) 提取压缩文件
ID: 1732158209058
