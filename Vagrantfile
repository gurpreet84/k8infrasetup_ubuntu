# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
#Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
 # config.vm.box = "bento/ubuntu-18.04"
  # -*- mode: ruby -*- # vi: set ft=ruby : # Every Vagrant development environment requires a box. You can search for # boxes at https://atlas.hashicorp.com/search. 
  BOX_IMAGE = "bento/ubuntu-18.04"
  MASTER_COUNT=2
  NODE_COUNT = 3
  Vagrant.configure("2") do |config|  
  (1..MASTER_COUNT).each do |i|
  config.vm.define "kubmaster#{i}" do |subconfig|  
  subconfig.vm.box = BOX_IMAGE   
  subconfig.vm.hostname = "master#{i}"   
  subconfig.vm.network :public_network, ip: "192.168.1.#{i + 159}"   
  subconfig.vm.provider :virtualbox do |vb|
  vb.name = "kubmaster#{i}"
  vb.memory = 4096
  end
  end
  end   
  
  # define  nginx server for load balancing masters
  config.vm.define "kubcluster" do |subconfig|  
  
  subconfig.vm.box = BOX_IMAGE    
  subconfig.vm.hostname = "kubcluster"   
  subconfig.vm.network :public_network, ip: "192.168.1.#{162}" 
  subconfig.vm.provider :virtualbox do |vb|
  vb.name = "kub_lb"
  vb.memory = 4096
  end
  subconfig.vm.provision "shell", path: "installdhcp.sh"
  end
  (1..NODE_COUNT).each do |i| 
  config.vm.define "node#{i}" do |subconfig|  
  
  subconfig.vm.box = BOX_IMAGE    
  subconfig.vm.hostname = "kubnode#{i}"   
  subconfig.vm.network :public_network, ip: "192.168.1.#{i + 162}" 
  subconfig.vm.provider :virtualbox do |vb|
  vb.name = "kubnode#{i}"
  vb.memory = 4096
  end
   subconfig.vm.provision "shell", path: "installdhcp.sh"
  end   
  end

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  #.vm.network "forwarded_port", guest: 22, host: 2222

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
 
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
 
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
 config.vm.provision "shell", path: "installdhcp.sh"
end
