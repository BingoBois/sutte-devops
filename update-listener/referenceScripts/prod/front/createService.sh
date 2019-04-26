sudo docker build -t lesfront:prod /home/bingo/sutte-frontend
sudo docker service create --replicas 2 --name lesfront --publish published=80,target=3000 --update-delay 5s lesfront:prod npm start
