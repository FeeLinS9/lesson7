# -*- mode: ruby -*- 
# vi: set ft=ruby : vsa
Vagrant.configure(2) do |config| 
  config.vm.box = "generic/centos8s" 
  config.vm.box_version = "4.3.4" 
  config.vm.provider "virtualbox" do |v| 
  v.memory = 512 
  v.cpus = 1 
  config.vm.network "private_network", ip: "192.168.56.10"
 # config.vm.network "forwarded_port", guest: 80, host: 80
  config.vm.hostname = "pm" 
 # config.vm.provision "shell", path: "nfss_script.sh"
  end 
 end 
 