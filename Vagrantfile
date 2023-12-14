# -*- mode: ruby -*- 
# vi: set ft=ruby : vsa
MACHINES = {
  :"pm" => {
              :box_name => "generic/centos8s",
              :box_version => "4.3.4",
              :cpus => 1,
              :memory => 1024,
              :ip_addr => '192.168.56.10',
            }
}

Vagrant.configure("2") do |config|
  MACHINES.each do |boxname, boxconfig|
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.define boxname do |box|
      box.vm.box = boxconfig[:box_name]
      box.vm.box_version = boxconfig[:box_version]
      box.vm.host_name = boxname.to_s
      box.vm.network "private_network", ip: boxconfig[:ip_addr]
      box.vm.provider "virtualbox" do |v|
        v.memory = boxconfig[:memory]
        v.cpus = boxconfig[:cpus]
      box.vm.provision "shell", path: "config.sh"
      end
    end
  end
end
