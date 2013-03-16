# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box       = "precise64"
  config.vm.box_url   = "http://files.vagrantup.com/precise64.box"
  config.vm.hostname  = "riemann.patrickod.dev"

  config.vm.network :public_network
  # config.vm.network :forwarded_port, :guest => 4567, :host => 4567, :id => "dashboard", :auto_correct => true
  # config.vm.network :forwarded_port, :guest => 5555, :host => 5555, :id => "riemann", :auto_correct => true, :protocol => "udp"
  # config.vm.network :forwarded_port, :guest => 5556, :host => 5556, :id => "riemann_ws", :auto_correct => true

  config.vm.provision :puppet do |puppet|
    puppet.module_path    = "modules"
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "main.pp"
  end
end
