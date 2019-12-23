deploy APP using jenkins,vagrant,ansible,docker,artifactory,selenium and sonarqube

>>>we are using vagrant as an IAC Tool to buid our infra then using ansible as a Configration Management Tool 


>>> dont forget to stop the firewall on both guest and host to allow the nginx http traffic:
  - on host :
    systemctl stop firewalld.service
    systemctl disable firewalld.service

  - on guest : 
    sudo ufw disable 

>>> there are many script for many cases
