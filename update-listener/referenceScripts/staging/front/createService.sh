sudo docker build -t lesfrontstaging:latest /home/bingo/sutte-frontend
sudo docker service create --replicas 2 --env-file="env.env" --name lesfrontstaging --publish published=8080,target=3000 --update-delay 5s lesfrontstaging:latest npm start
