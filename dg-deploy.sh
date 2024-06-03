git pull origin main 
npm run build
cp -r npm build/npm
docker compose down 
docker compose up --build -d
