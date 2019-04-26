cd /home/bingo/sutte-backend
git pull
sudo docker build -t lesbackstaging:latest .
sudo docker service update --force --image lesbackstaging:latest lesbackstaging
