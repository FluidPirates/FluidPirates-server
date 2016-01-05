# ssh -i ~/code/keys/AWSDorianskeys.pem ubuntu@52.31.58.176
git pull
sudo docker build -t fluidpirates-server .
sudo docker stop $(sudo docker ps -a -q)
sudo docker run -v $(pwd):/app -e RAILS_ENV=production -t fluidpirates-server rake db:migrate
sudo docker run -d -p 80:3000 -v $(pwd)/db:/app/db -e RAILS_ENV=production -t fluidpirates-server

# Optional, reset database:
# sudo docker run -v $(pwd):/app -e RAILS_ENV=production -t fluidpirates-server rake db:reset

