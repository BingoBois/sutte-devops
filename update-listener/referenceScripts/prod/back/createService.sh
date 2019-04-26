sudo docker build -t lesbackprod:latest /home/bingo/sutte-backend
sudo docker service create --replicas 2 --name lesbackprod --publish published=3000,target=3000 --update-delay 5s lesbackprod:latest npm start
