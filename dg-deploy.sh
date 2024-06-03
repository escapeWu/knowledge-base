git pull origin main 
npm run build
cp -r npm dist/npm
docker compose down 
docker compose up --build -d
