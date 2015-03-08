# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "debian-wheezy"
  config.vm.forward_port 80, 8080
  config.vm.provision :shell, :path => "script/bootstrap-squeeze"
end
