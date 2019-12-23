#!/bin/bash

# install docker
sudo apt-get update
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update
sudo apt-get install -y docker-ce

# Allow vagant user to run docker
sudo usermod -a -G docker vagrant


# install git 
sudo apt-get install -y git

# clone my github repo 
sudo git clone https://github.com/zeineldin/docker-nginx-sandbox.git
cd docker-nginx-sandbox

# build the docker immage named testnginx
sudo docker build -t testnginx .

# run docker 
sudo docker run -d -p 80:80 testnginx

# -----------

TERRAFORM_VERSION="0.11.7"

# install pip
sudo wget -q https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
sudo python3 get-pip.py

# install awscli
sudo pip install -U awscli

# install gip
sudo apt-get -y install gzip unzip

# install terraform

sudo wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
sudo unzip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin
sudo rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip