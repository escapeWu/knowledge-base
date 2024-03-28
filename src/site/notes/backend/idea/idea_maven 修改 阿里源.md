---
{"dg-publish":true,"permalink":"/backend/idea/idea-maven/","created":"2024-02-26T16:23:22.768+08:00","updated":"2024-02-26T16:29:11.631+08:00"}
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