# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "sinergi/centos-65-x64"

  config.vm.network :private_network, ip: "192.168.20.101"

  config.vm.synced_folder ".", "/vagrant", id: "vagrant-root",
    :mount_options => ["uid=48,gid=48,dmode=775,fmode=664"]

  config.vm.usable_port_range = (2200..2250)
  config.vm.provider :virtualbox do |virtualbox|
    virtualbox.customize ["modifyvm", :id, "--name", "library"]
    virtualbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    virtualbox.customize ["modifyvm", :id, "--memory", "1024"]
    virtualbox.customize ["setextradata", :id, "--VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end

  config.ssh.username = "vagrant"
  config.ssh.keep_alive = true
  config.ssh.forward_agent = false
  config.ssh.forward_x11 = false
  config.vagrant.host = :detect

  config.vm.provision :shell, :path => "env/commands/puppet.sh"
  #config.vm.provider :virtualbox do |vb|
  #  vb.gui = true
  #end
end
