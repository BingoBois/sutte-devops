cd /home/bingo/sutte-frontend
git pull
sudo docker build -t lesfront:staging .
sudo docker service update --force --image lesfront:staging lesfront
