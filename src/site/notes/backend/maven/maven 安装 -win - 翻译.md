---
{"dg-publish":true,"permalink":"/backend/maven/maven-win/","created":"2024-03-28T11:16:56.674+08:00","updated":"2024-03-28T11:28:33.646+08:00"}
---

#mvn 

https://maven.apache.org/install.html
ApacheMaven 的安装是一个简单的过程，即提取存档文件并使用 mvn 命令将 bin 目录添加到 PATH 中。
详细步骤：
+ 系统已经安装好java JDK，并在环境变量中正确配置JAVA_HOME
+ 解压maven 安装包至任意目录
+ 将maven 所在目录的bin 路径加入到环境变量 PATH下
+ 通过mvn -v 来确认是否安装完成, 正确配置的结果应该和下面类似
	```
	Apache Maven 3.9.6 (bc0240f3c744dd6b6ec2920b3cd08dcc295161ae)
	Maven home: /opt/apache-maven-3.9.6
	Java version: 1.8.0_45, vendor: Oracle Corporation
	Java home: /Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home/jre
	Default locale: en_US, platform encoding: UTF-8
	OS name: "mac os x", version: "10.8.5", arch: "x86_64", family: "mac"
	```
