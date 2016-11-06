# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.5.0"
unless Vagrant.has_plugin?("vagrant-vbguest")
  raise "Vagrant plugin vagrant-vbguest is missing. Run `vagrant plugin install vagrant-vbguest`"
end
Vagrant.configure(2) do |config|

	# Base box
	config.vm.box = "ubuntu/trusty64"
	#config.vm.box_version = "1603.01"
  	#config.vm.box_check_update = false

	# Virtual box configuration
	config.vm.provider "virtualbox" do |vb|
		vb.name = "canvas-lms2"
		vb.customize ["modifyvm", :id, "--memory", "2048"]
		#vb.customize ["modifyvm", :id, "--cpuexecutioncap", "90"]
		vb.customize ["modifyvm", :id, "--cpus", "2"]
	end
	# Provisioning
	#config.vm.provision :shell, path: "bootstrap.sh"

	# Network configuration
   	config.vm.network "private_network", ip: "192.168.39.39"
	config.vm.network "forwarded_port", guest: 3000, host: 3000
end
