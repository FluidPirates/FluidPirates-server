sudo apt-get install git
https://github.com/FluidPirates/FluidPirates-server
cd FluidPirates-server

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

sudo sh -c 'echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list'

sudo apt-get update

sudo apt-get install linux-image-extra-$(uname -r)

sudo apt-get install docker-engine

sudo service docker start

sudo sh -c 'docker build -t fluidpirates-server .'
sudo sh -c 'docker run -tP fluidpirates-server'

sudo docker run -p 80:3000 -v $(pwd)/db:/app/db -t fluidpirates-server

sudo docker build -t fluidpirates-server .

sudo docker run -v $(pwd):/app -e RAILS_ENV=production -t fluidpirates-server rake db:reset

sudo docker run -p 80:3000 -v $(pwd)/db:/app/db -e RAILS_ENV=production -t fluidpirates-server
