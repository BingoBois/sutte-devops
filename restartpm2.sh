git pull
cd update-listener
pm2 delete 0
pm2 start app.js
