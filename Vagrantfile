# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/trusty64'
  config.vm.network :private_network, :ip => "192.168.200.67"
  config.vm.provider :virtualbox do |v|
  	v.customize ["modifyvm", :id, "--memory", 2048]
  end

  config.vm.provision 'chef_solo' do |chef|
    chef.add_recipe 'git'
    chef.add_recipe 'java'
    chef.add_recipe 'python'
    chef.add_recipe 'teletraan::default'

    chef.json = {
        "java" => {
            "install_flavor" => "oracle",
            "jdk_version" => "8",
            "oracle" =>  {
              "accept_oracle_download_terms" => true
            }
          }
  }
    chef.arguments = '-l debug'
    chef.arguments= '--force-logger info'
    chef.cookbooks_path = ".."
  end
end
