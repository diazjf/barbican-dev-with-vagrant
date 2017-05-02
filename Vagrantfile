# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/xenial64"

  # Barbican Port
  config.vm.network "forwarded_port", guest: 9311, host: 9311

  # Keystone Port
  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "2048"
      vb.cpus = "2"
  end
  config.vm.provision "shell", path: "install.sh", privileged: false
end
