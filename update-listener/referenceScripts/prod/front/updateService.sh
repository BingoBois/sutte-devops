cd /home/bingo/sutte-frontend
git pull
sudo docker build -t lesfrontprod:latest .
sudo docker service update --force --image lesfrontprod:latest lesfrontprod
