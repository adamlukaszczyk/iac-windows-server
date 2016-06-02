# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  
  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "opentable/win-2012r2-standard-amd64-nocm"
  config.vm.communicator = "winrm"
  config.vm.hostname = "XedoDev"	
  
  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provision :shell, path: "shell/main.cmd"
  
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = ""
    puppet.manifest_file  = "base.pp"
  end
end
