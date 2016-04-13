# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 443, host: 4443

  # Barbican Ports
  config.vm.network "forwarded_port", guest: 9311, host: 9311

  # Keystone Ports
  config.vm.network "forwarded_port", guest: 35357, host: 35357
  config.vm.network "forwarded_port", guest: 5000, host: 5000

  # Other App
  config.vm.network "forwarded_port", guest: 5001, host: 5001

  config.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "4096"
      vb.cpus = "2"
  end
  config.vm.provision "shell", path: "install.sh", privileged: false
  config.vm.synced_folder "./devstack", "/opt/stack", create: true
end
