# -*- mode: ruby -*-
# vi: set ft=ruby :

# Package external Cookbooks by using the command below
# tar zcvf chef-solo.tar.gz ./cookbooks

chef_solo_cookbook_path = ["cookbooks"]

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

# Vagrant.require_version '>= 1.5.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # config.vm.hostname = 'virtual-selenium-grid-berkshelf'

  # Set the version of chef to install using the vagrant-omnibus plugin
  # NOTE: You will need to install the vagrant-omnibus plugin:
  #
  #   $ vagrant plugin install vagrant-omnibus
  #
  # if Vagrant.has_plugin?("vagrant-omnibus")
  #   config.omnibus.chef_version = :latest
  # end

  # Used for Ubuntu Boxes (Selenium Hub and Source Code)
  config.vm.define :ubuntu_hub, primary: true do |hub|
    hub.vm.box = "ubuntu/trusty64"
    # hub.vm.box = "precise64"
    hub.vm.box_url = "~/_dev/vagrant/trusty-server-cloudimg-amd64-vagrant-disk1.box"
    hub.vm.hostname = "selenium.local"
    hub.vm.network :forwarded_port, guest: 4440, host: 4440
    hub.vm.network "private_network", ip: "192.168.15.2"

    hub.vm.provider :virtualbox do |vb|
      vb.customize [
        "modifyvm", :id,
        "--name", "ubuntu-hub.selenium.local"
      ]
    end

    hub.vm.provision :chef_solo do |chef|
      chef.run_list = [
        'recipe[virtual-selenium-grid::default]'
      ]
    end
  end

  config.vm.define :ubuntu_node, primary: true do |hub|
    hub.vm.box = "ubuntu/trusty64"
    # hub.vm.box = "precise64"
    hub.vm.box_url = "~/_dev/vagrant/trusty-server-cloudimg-amd64-vagrant-disk1.box"
    hub.vm.hostname = "node.selenium.local"
    hub.vm.network "private_network", ip: "192.168.15.3"

    hub.vm.provider :virtualbox do |vb|
      vb.customize [
        "modifyvm", :id,
        "--name", "node.selenium.local"
      ]
    end

    hub.vm.provision :chef_solo do |chef|
      chef.run_list = [
        'recipe[mozilla-firefox::default]',
        'recipe[virtual-selenium-grid::node]'
      ]
    end
  end

  config.vm.define :ubuntu_node2, primary: true do |hub|
    hub.vm.box = "ubuntu/trusty64"
    # hub.vm.box = "precise64"
    hub.vm.box_url = "~/_dev/vagrant/trusty-server-cloudimg-amd64-vagrant-disk1.box"
    hub.vm.hostname = "node2.selenium.local"
    hub.vm.network "private_network", ip: "192.168.15.4"

    hub.vm.provider :virtualbox do |vb|
      vb.customize [
        "modifyvm", :id,
        "--name", "node2.selenium.local"
      ]
    end

    hub.vm.provision :chef_solo do |chef|
      chef.run_list = [
        'recipe[mozilla-firefox::default]',
        'recipe[virtual-selenium-grid::node]'
      ]
    end
  end

  config.vm.define :ubuntu_node3, primary: true do |hub|
    hub.vm.box = "ubuntu/trusty64"
    # hub.vm.box = "precise64"
    hub.vm.box_url = "~/_dev/vagrant/base/trusty-server-cloudimg-amd64-vagrant-disk1.box"
    hub.vm.hostname = "node3.selenium.local"
    hub.vm.network "private_network", ip: "192.168.15.5"

    hub.vm.provider :virtualbox do |vb|
      vb.customize [
        "modifyvm", :id,
        "--name", "node3.selenium.local"
      ]
    end

    hub.vm.provision :chef_solo do |chef|
      chef.run_list = [
        'recipe[mozilla-firefox::default]',
        'recipe[virtual-selenium-grid::node]'
      ]
    end
  end

  # config.vm.define :"win2k8-r2-base" do |win|
  # config.vm.define :win7_ie10_base do |win|
  #   win.vm.box = "vagrant-win7-ie10"
  #   win.vm.box_url = "~/_dev/vagrant/base/win7-ie10-base.box"
  #   win.vm.synced_folder ".", "/vagrant", disabled: true
  #   win.vm.guest = :windows
  #   win.vm.communicator = "winrm"
  #
  #   win.vm.hostname = "win-node1.selenium.local"
  #   # node.winrm.timeout = 500
  #
  #   # Network settings
  #   win.vm.network :forwarded_port, host: 3389, guest: 3389 #RDP
  #   win.vm.network :forwarded_port, guest: 5985, host: 5985, id: "winrm", auto_correct: true
  #   # win.vm.network "private_network", ip: "192.168.15.3"
  #   win.windows.set_work_network = true
  #   win.vm.provider :virtualbox do |vb|
  #     vb.customize [
  #       "modifyvm", :id,
  #       "--name", "win-node1.selenium.local",
  #       "--memory", "512"
  #       # "--nic2", "hostonly"
  #       # ,"--cpuexecutioncap", "50"
  #     ]
  #     vb.gui = true
  #   end
  #
  #   node.vm.provision :chef_solo do |chef|
  #     chef.run_list = [
  #       'recipe[virtual-selenium-grid::windows::default]'
  #     ]
  #   end
  # end
end
