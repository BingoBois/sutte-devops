cd /home/bingo/sutte-backend
git pull
sudo docker build -t lesbackprod:latest .
sudo docker service update --force --image lesbackprod:latest lesbackprod
