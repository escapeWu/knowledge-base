git pull origin main 
npm run build
docker compose down 
docker compose up --build -d
