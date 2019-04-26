sudo docker build -t lesfront:staging /home/bingo/sutte-frontend
sudo docker service create --replicas 2 --name lesfront --publish published=8080,target=3000 --update-delay 5s lesfront:staging npm start
