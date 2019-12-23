# The "2" in the first line above represents the version of the configuration object config that will be used for configuration for that block (the section between the do and the end) 


Vagrant.configure("2") do |config|                 
  #----------------- Host1 ---------------------
  config.vm.define "host1", primary: true do |host1|       
  #Using config.vm.define, you can create multiple VMs (as many as you’d like) within a single Vagrantfile. 
    host1.vm.box = "ubuntu/xenial64"
    host1.vm.hostname = 'host1'    
    host1.vm.network :private_network, ip: "192.168.2.61" , :netmask => "255.255.255.0"
    host1.vm.network "forwarded_port", guest: 80, host: 8081
#    host2.vm.network "forwarded_port", guest: 8080, host: 8083  # for java app

    host1.vm.synced_folder "/home/ansible/.ssh/", "/tmp/shared/", :mount_options => ["dmode=777", "fmode=666"]
    #host1.vm.synced_folder "./shared/host1", "/var/www/html", :mount_options => ["dmode=777", "fmode=666"]

    #-------- shell------
    config.vm.provision "shell", inline: <<-SHELL
    cat /tmp/shared/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
    ssh-keygen -R 192.168.1.61
#   apt-get update
    echo "-----------------------"
    SHELL

    #config.vm.provision "shell", path: "bootstrap.sh"    #  if needed
    #-------- shell ------- 

   
    #-------- Provider-Section  -------
    host1.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 512]
      v.customize ["modifyvm", :id, "--name", "host1"]
    end
    #-------- Provider-Section  -------  
  
  end

  #----------------- host2 ---------------------
  config.vm.define "host2", primary: false do |host2|       
  #Using config.vm.define, you can create multiple VMs (as many as you’d like) within a single Vagrantfile. 
    host2.vm.box = "ubuntu/xenial64"
    host2.vm.hostname = 'host2'    
    host2.vm.network :private_network, ip: "192.168.2.62" , :netmask => "255.255.255.0"
    host2.vm.network "forwarded_port", guest: 80, host: 8082
#    host2.vm.network "forwarded_port", guest: 8080, host: 8084  # for java app

    host2.vm.synced_folder "/home/ansible/.ssh", "/tmp/shared",  :mount_options => ["dmode=777", "fmode=666"]
    #host2.vm.synced_folder "./shared/host2", "/var/www/html", :mount_options => ["dmode=777", "fmode=666"]

    #-------- shell------
    config.vm.provision "shell", inline: <<-SHELL
    cat /tmp/shared/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
    ssh-keygen -R 192.168.2.62
#   apt-get update 
    echo "-----------------------"
    SHELL

    #config.vm.provision "shell", path: "bootstrap.sh"    # doing the same " "shell", inline: "
    #-------- shell ------- 

   
    #-------- Provider-Section  -------
    host2.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"] #to allow VM to resolve the DN
      v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      v.customize ["modifyvm", :id, "--memory", 512]
      v.customize ["modifyvm", :id, "--name", "host2"]
    end
    #-------- Provider-Section  -------  
  
  end

end
