cd /home/bingo/sutte-frontend
git pull
sudo docker build -t lesfrontstaging:latest .
sudo docker service update --force --image lesfrontstaging:latest lesfrontstaging
