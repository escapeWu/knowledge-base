---
{"dg-publish":true,"permalink":"/tools/docker/docker-networking-in-compose/","created":"2024-04-10T17:36:40.000+08:00","updated":"2024-04-10T17:36:40.000+08:00"}
---

> 该文章是 docker 官网 Manual - Networking in Compose 章节翻译

默认情况下，Compose为您的应用程序设置了一个单一网络。每个服务的容器都加入默认网络，可以被该网络上的其他容器访问，并且可以通过==容器服务名进行发现==。
> 译者注：服务名可以看作是该网络下的域名，该服务名最终指向这个network的私有ip

假设你的app在myapp 目录下，并且你的compose.yml 如下：
```yml
services:
  web:
    build: .
    ports:
      - "8000:8000"
  db:
    image: postgres
    ports:
      - "8001:5432"	
```
当执行 docker compose up 指令后，具体执行过程如下:
1. 一个名为 myapp_default 的 network 被创建
2. 一个使用了`web`配置的 容器被创建。这个容器以 `web`作为服务名，加入到myapp_default network
3. 一个使用了`db`配置项的容器被创建。这个容器以db作为服务名，加入到myapp_default network
现在myapp 下的任意容器能够通过查找服务名 比如 `web` 或 `db` 来获取容器的准确ip。比如`web`应用可以通过`postgres://db:5432`访问postgres数据库。

注意，`HOST_PORT` 和 `CONTAINER_PORT` 是不同的。在上述例子中，以db为例，`HOST_PORT`是 `8001` 容器内部端口是`5432`。同一个网络下的服务通信使用的是`CONTAINER_PORT`. 而`HOST_PORT`是允许该服务被该network外部访问。

一个简单例子，nginx 前端访问nodejs后端，使用服务名方式进行
```
// docker-compose.yml
version: '3'
services:
  nginx:
    image: nginx:latest
    ports:
      - "80:80"
  nodejs:
    image: node:latest
    # 这里是你的Node.js应用程序的其他配置
// nginx.conf
server {
    listen 80;

    location / {
        proxy_pass http://nodejs:3000; # 这里使用服务名来访问Node.js服务
    }
}
```

### 更新network下的容器
如果你更改了docker-compose 下某个服务的配置项并执行了docker compose up 进行更新，旧的容器首先被删除，然后==新容器使用一个全新的ip地址==加入到这个网络中。==正在运行中的容器能够查找该服务名并且连接到这个新的地址==，但是旧容器对应的地址已不可用。

==如果有其他容器与老的容器还存在连接，这些容器会被关闭==。对于上述情况，主动查找名称进行重连是容器本身的职责

> TIP
> 尽可能通过服务名访问容器，而不是IP。否则发生上述情况，每次都要手动修改你所使用的IP

### [Link containers](https://docs.docker.com/compose/networking/#link-containers)
Links 允许你为一个服务定义别名。links对于容器通信来说非必须。默认情况下，容器与容器可以通过名称互相访问。在下面例子中，`db` 可以被 web 服务通过 db 以及 database 服务名访问
```
services:
  web:
    build: .
    links:
      - "db:database"
  db:
    image: postgres
```
## [Specify custom networks](https://docs.docker.com/compose/networking/#specify-custom-networks)
除了使用默认的network，你还可以通过 `networks`关键字来指定。这允许您创建更复杂的拓扑结构，并指定自定义的网络驱动程序和选项。您还可以使用它将服务连接到由Compose未管理的外部创建的网络。
==通过在service 那一层定义networks字段，每个服务都能指定它用什么network。这一层级可选择的network清单由顶级的networks 字段来定义。==
如下例子介绍了 一个compose文件定义两个自定义的networks。proxy服务和db服务隔离，因为它们没有共享同一个network。只有 `app`可以和`proxy` 以及 `db`互相通信
```yml
services:
  proxy:
    build: ./proxy
    networks:
      - frontend
  app:
    build: ./app
    networks:
      - frontend
      - backend
  db:
    image: postgres
    networks:
      - backend

networks:
  frontend:
    # Use a custom driver
    driver: custom-driver-1
  backend:
    # Use a custom driver which takes special options
    driver: custom-driver-2
    driver_opts:
      foo: "1"
      bar: "2"
```
每个network还可以通过 [ipv4_address and/or ipv6_address](https://docs.docker.com/compose/compose-file/05-services/#ipv4_address-ipv6_address)  来设置固定ip 

network 也能设置 [别名](https://docs.docker.com/compose/compose-file/06-networks/#name):
```yml
services:
  # ...
networks:
  frontend:
    name: custom_frontend
    driver: custom-driver-1
```

### [Configure the default network](https://docs.docker.com/compose/networking/#configure-the-default-network)
同样，我们compose 的默认network 也可以 `default`字段进行修改
```yml
services:
  web:
    build: .
    ports:
      - "8000:8000"
  db:
    image: postgres

networks:
  default:
    # Use a custom driver
    driver: custom-driver-1
```

### [Use a pre-existing network](https://docs.docker.com/compose/networking/#use-a-pre-existing-network)

如果你想让你的容器加入一个现有的network，使用 `external` 选项
```yml
services:
  # ...
networks:
  network1:
    name: my-pre-existing-network
    external: true
```