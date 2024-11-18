---
{"dg-publish":true,"permalink":"/06-tools/docker/docker-media-all-in-one/","created":"2024-05-27T15:03:24.000+08:00","updated":"2024-05-27T15:03:24.000+08:00"}
---

#docker 

这篇文章为高阶追剧流程的 docker-compose 一键部署模板，有时间会加上注释和教程

<!-- more -->

```yml
[[A TODO]] 

这篇文章为高阶追剧流程的 docker-compose 一键部署模板，有时间会加上注释和教程

![[test]]

<!-- more -->

```yml
version: "3"
services:
  chinesesubfinder:
    image: allanpk716/chinesesubfinder:latest
    container_name: chinesesubfinder
    hostname: chinesesubfinder
    restart: always
    environment:
      - PUID=0
      - PGID=0
      - PERMS=true
      - TZ=Asia/Shanghai
      - UMASK=022
    ports:
      - "19035:19035"
      - "19037:19037"
    volumes:
      - /home/shancw/dock1/config/subfinder/config:/config
      - /home/shancw/dock1/config/subfinder/browser:/root/.cache/rod/browser
      - /home/shancw/dock1/media:/media
      - /home/shancw/dock1/media/tv:/media/tv
      - /home/shancw/dock1/media/movie:/media/movie
      - /home/shancw/dock1/media/anime:/media/anime
    logging:
      driver: json-file
      options:
        max-size: "100m"

  nas-tools:
    image: shancw/nastool:latest
    # ports:
    #   - 3000:3000        # 默认的webui控制端口
    volumes:
      - /home/shancw/dock1/config/nastool-custom:/config   # 冒号左边请修改为你想保存配置的路径
      - /home/shancw/dock1/media/av:/media/av
      - /home/shancw/dock1/media/movie:/media/movie
      - /home/shancw/dock1/media/tv:/media/tv
      - /home/shancw/dock1/media/anime:/media/anime
      - /home/shancw/dock1/media/downloads:/media/downloads
    environment:
      # - HTTP_PROXY=http://192.168.5.185:7890
      # - HTTPS_PROXT=http://192.168.5.185:7890
      # - All_PROXY=http://192.168.5.185:7891
      - PUID=0    # 想切换为哪个用户来运行程序，该用户的uid
      - PGID=0    # 想切换为哪个用户来运行程序，该用户的gid
      - UMASK=000 # 掩码权限，默认000，可以考虑设置为022
      - NASTOOL_AUTO_UPDATE=false  # 如需在启动容器时自动升级程程序请设置为true
      - NASTOOL_CN_UPDATE=false # 如果开启了容器启动自动升级程序，并且网络不太友好时，可以设置为true，会使用国内源进行软件更新
    restart: always
    network_mode: host
    hostname: nas-tools
    container_name: nas-tools

  qbittorrent:
    image: superng6/qbittorrentee:4.5.4.10
    container_name: qbittorrent
    environment:
      - PUID=0
      - PGID=0
      - TZ=Asia/Shanghai
      - WEBUIPORT=8080
    volumes:
      - /home/shancw/dock1/config/qbit:/config
      - /home/shancw/dock1/media/downloads:/downloads
      - /home/shancw/dock1/media/anime:/downloads/ab
      - /etc/nginx/https_cert:/ssl_cert
    network_mode: host
    restart: unless-stopped
  AutoBangumi:
    image: estrellaxd/auto_bangumi:latest
    container_name: AutoBangumi
    volumes:
      - /home/shancw/dock1/config/AutoBangumi/config:/app/config
      - /home/shancw/dock1/config/AutoBangumi/data:/app/data
    environment:
      - HTTP_PROXY=http://192.168.5.185:7890
      - HTTPS_PROXT=http://192.168.5.185:7890
      # - All_PROXY=http://192.168.5.185:7891
    ports:
      - 7892:7892
    restart: unless-stopped
    dns:
      - 223.5.5.5
    network_mode: bridge
  emby:
    image: emby/embyserver
    container_name: embyserver
    environment:
      - UID=0 # The UID to run emby as (default: 2)
      - GID=0 # The GID to run emby as (default 2)
      - GIDLIST=100 # A comma-separated list of additional GIDs to run emby as (default: 2)
      - TZ=Asia/Shanghai
      - HTTP_PROXY=http://127.0.0.1:7890
      - All_PROXY=http://127.0.0.1:7890
    network_mode: host
    restart: unless-stopped
    volumes:
      - /home/shancw/dock1/media/av:/media/av
      - /home/shancw/dock1/media/movie:/media/movie
      - /home/shancw/dock1/media/tv:/media/tv
      - /home/shancw/dock1/media/anime:/media/anime
      - /home/shancw/dock1/config:/config # Configuration directory
    deploy:
      resources:
        reservations:
          devices:
            - driver: nvidia
              count: 1
              capabilities: [gpu]
```

TIPS: 补充两个老司机专用链接,支持种子下载和字幕

- https://jable.tv 在线
- https://www.javbus.com/ 种子下载
