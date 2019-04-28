sudo docker build -t lesfrontprod:latest /home/bingo/sutte-frontend
sudo docker service create --replicas 2 --env-file="env.env" --name lesfrontprod --publish published=80,target=3000 --update-delay 5s lesfrontprod:latest npm start
