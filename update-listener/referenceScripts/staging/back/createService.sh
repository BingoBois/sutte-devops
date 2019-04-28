sudo docker build -t lesbackstaging:latest /home/bingo/sutte-backend
sudo docker service create --replicas 2 --env-file="env.env" --name lesbackstaging --publish published=3030,target=3000 --update-delay 5s lesbackstaging:latest npm start
