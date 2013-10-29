# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "precise_vmware"
    config.vm.box_url = "http://files.vagrantup.com/precise64_vmware.box"
    config.vm.network :forwarded_port, guest: 9200, host: 9200
    config.vm.provision :puppet do |puppet|
            puppet.module_path = './setup/modules'
            puppet.manifests_path = './setup/manifests'
            puppet.manifest_file = 'default.pp'
            puppet.options = '--verbose --debug'
          end
end
