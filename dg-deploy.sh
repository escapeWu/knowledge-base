git pull origin main && \
 docker stop digital-garden && \
 docker rm -f digital-garden && \
 docker rmi digital-garden && \
npm run build && \
docker build -t digital-garden . &&\
docker run -d -p 7777:7777 --name digital-garden digital-garden
