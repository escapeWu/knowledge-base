---
{"dg-publish":true,"permalink":"/02-backend/idea/idea-maven/","created":"2024-09-18T14:20:19.178+08:00","updated":"2024-05-27T15:04:09.000+08:00"}
---

![Pasted image 20240226162903.png](/img/user/attachments/Pasted%20image%2020240226162903.png)

settings.xml (没有自己创建一个)
```xml
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                          https://maven.apache.org/xsd/settings-1.0.0.xsd">
      
      <mirrors>
    	<mirror>  
      		<id>alimaven</id>  
      		<name>aliyun maven</name>  
      		<url>http://maven.aliyun.com/nexus/content/groups/public/</url>  
      		<mirrorOf>central</mirrorOf>          
    	</mirror>  
      </mirrors>
</settings>
```