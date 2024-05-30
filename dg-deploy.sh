git pull origin main && \
npm run build && \
docker compose down -v && \
docker compose up -d
