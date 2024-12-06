# 使用官方 Nginx 镜像
FROM docker.imwsc.com/nginx:latest

# 删除默认的 Nginx 配置文件
RUN rm /etc/nginx/conf.d/default.conf

# 将自定义的 Nginx 配置文件复制到容器中
COPY nginx.conf /etc/nginx/conf.d/

# 将 dist 目录中的内容复制到 Nginx 默认的静态文件目录
COPY dist/ /usr/share/nginx/html/

