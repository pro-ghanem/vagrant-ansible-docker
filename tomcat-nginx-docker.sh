#!/bin/bash

# install docker
sudo apt-get update
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update
sudo apt-get install -y docker-ce
#install tomcat
sudo apt-get install default-jdk
wget http://www.apache.org/dist/tomcat/tomcat-8/v8.0.21/bin/apache-tomcat-8.0.21.tar.gz
sudo tar -zxvf apache-tomcat-8.0.21.tar.gz -C /var/local/


# Allow vagant user to run docker
sudo usermod -a -G docker vagrant
#sudo usermod -a -G docker ansible


# install git 
sudo apt-get install -y git


#disable the firewall
sudo ufw disable

# -----------

#prepare anible user
#useradd -m -d /home/ansible -s /bin/bash ansible
cat >> /etc/sudoers <<EOL
vagrant ALL=(ALL:ALL) ALL
vagrant ALL=(ALL) NOPASSWD:ALL
EOL
PWD

