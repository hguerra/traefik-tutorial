#!/bin/bash

echo "> Init dev environment"
cd ~/

echo "> apt-get update"
sudo apt-get update

echo "> apt-get install..."

# Git
echo ">> installing git"
sudo apt-get install git -y

# Docker
echo ">> installing docker"
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" -y

sudo apt-get update
sudo apt-get install docker-ce -y
sudo systemctl status docker

echo ">> installing docker-compose"
sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo ">> running docker without sudo"
sudo usermod -aG docker $(whoami)
