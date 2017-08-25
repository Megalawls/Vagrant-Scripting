# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  #setting hostname of new vm and box image (Ubuntu 14.04 with GUI)
  config.vm.hostname = "QAserver.local"
  config.vm.box = "chad-thompson/ubuntu-trusty64-gui"
  config.vm.network "public_network", ip: "192.168.33.221"

 config.vm.synced_folder "C:\\Users\\Administrator\\Documents\\VagrantSetup\\VagrantShare", "/vagrant_data"
 
 config.vm.provision :shell, path: "bootstrap.sh"

 #Setting up virtual box information, ram allocation, etc.
 config.vm.provider "virtualbox" do |master|
  	# Display the VirtualBox GUI when booting the machine
  	master.gui = true
	master.name = "QAserver"
	# Customize the amount of memory on the VM:
	master.memory = 4096
	master.cpus = 2
  # Initialises with bidirectional clipboard in Virtual machine
	master.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
 end
end





