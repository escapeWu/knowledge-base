---
{"dg-publish":true,"permalink":"/06-tools/docker/docker-compose-depends-on/","title":"docker compose 下通过depends on + health check 解决 挂载网盘目录被其他容器抢先生成目录","created":"2024-06-18T15:31:48.220+08:00","updated":"2024-06-18T15:31:32.000+08:00"}
---

问题描述：
使用cloudnas 挂载网络硬盘到本地目录，但是被emby 映射的相同目录抢先生成，导致cloudnas 挂载失败，理由：目录非空

解决方案：
给emby 加上depends_on ，给cloudnas 加上healthcheck，只有cloudnas挂载成功，才会创建emby

```xml
services:
  cloudnas:
    image: docker.imwsc.com/cloudnas/clouddrive2
    volumes:
      - /home/shancw/dock1/media/aliyun/media:/media:shared #optional media path of host
    healthcheck:
      test: ["CMD", "ls", "/media/CloudDrive"]
      interval: 5s
      timeout: 10s
      retries: 10
  emby:
    image: docker.imwsc.com/emby/embyserver
    volumes:
      - /home/shancw/dock1/media/aliyun/media/CloudDrive/阿里云盘Open:/media/aliyun
    depends_on:
      cloudnas:
        condition: service_healthy
```