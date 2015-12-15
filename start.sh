#!/bin/bash

apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 \
  --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" \
  >> /etc/apt/sources.list.d/docker.list
apt-get update && apt-get install -y docker-engine
service docker restart

curl -L https://github.com/docker/compose/releases/download/\
1.5.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

mkdir redmine-data
chmod 777 redmine-data

mkdir pg-data
chmod 777 pg-data

docker-compose up -d
