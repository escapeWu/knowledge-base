---
{"dg-publish":true,"permalink":"/backend/nacos-mysql-springboot-docker/","created":"2024-04-10T17:36:40.000+08:00","updated":"2024-04-10T17:36:40.000+08:00"}
---

#docker #nacos #spring 
本文介绍了在docker 环境中，如何正确连同nacos 以及mysql。需要的前置知识请看[[Tools/Docker/docker Networking in Compose\|docker Networking in Compose]]

**STEP 1**
创建一个docker network: `docker network create general_backend`
> [[Tools/Docker/network\|reference: netowrk]]

**STEP 2:**
为每一个compose 文件顶级增加networks 关键字配置
```
version: '3.8'
services:
...
networks:
  default:
    name: general_backend
    external: true
```
含义：使用外部名为general_backend 的network作为该compose的默认network

**STEP 3**： nacos调整
修改nacos 对应的spring boot项目配置文件，==更改mysql 地址 为 容器名称
![Pasted image 20240314170118.png](/img/user/attachments/Pasted%20image%2020240314170118.png)

**STEP 4**: spring 配置文件中修改nacos地址为nacos 容器名称
![Pasted image 20240314170321.png](/img/user/attachments/Pasted%20image%2020240314170321.png)

**前置环境参考**
+ nacos 服务
	```yml
	version: "2"
	services:
	  nacos:
	    image: nacos/nacos-server:${NACOS_VERSION}
	    container_name: nacos-standalone
	    environment:
	      - PREFER_HOST_MODE=hostname
	      - MODE=standalone
	      - NACOS_AUTH_IDENTITY_KEY=serverIdentity
	      - NACOS_AUTH_IDENTITY_VALUE=security
	      - NACOS_AUTH_TOKEN=SecretKey012345678901234567890123456789012345678901234567890123456789
	    volumes:
	      - ./standalone-logs/:/home/nacos/logs
	    ports:
	      - "8848:8848"
	      - "9848:9848"
	  prometheus:
	    container_name: prometheus
	    image: prom/prometheus:latest
	    volumes:
	      - ./prometheus/prometheus-standalone.yaml:/etc/prometheus/prometheus.yml
	    ports:
	      - "9090:9090"
	    depends_on:
	      - nacos
	    restart: on-failure
	  grafana:
	    container_name: grafana
	    image: grafana/grafana:latest
	    ports:
	      - 3000:3000
	    restart: on-failure	
	```
+ mysql 服务
	```yml
	version: '3.8'
	services:
	  mysql:
	    image: mysql:latest
	    ports: 
	      - 3306:3306
	    container_name: mysql
	    environment:
	      - "MYSQL_ROOT_PASSWORD=123456"
	      - "MYSQL_DATABASE=mydb"
	      - "TZ=Asia/Shanghai"
	    volumes:
	      - "./data/db:/var/lib/mysql"
	```
+ springboot 服务
	```yml
	version: '3.8'
	services:
	  app_api:
	    build: .
	    volumes:
	      - ./online.jar:/app/online.jar
	    ports:
	      - "8101:8100"
	networks:
	  default:
	    name: general_backend
	    external: true
	```