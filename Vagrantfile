Vagrant::Config.run do |config|

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network :bridged,  :bridge => "eth0"
  
  # turn on swap
  config.vm.provision :shell, :inline => 'grep -c "vm\.overcommit_memory = 1" /etc/sysctl.conf || sudo echo "vm.overcommit_memory = 1" >> /etc/sysctl.conf && sudo sysctl -p'
  
  # install dnsmasq
  config.vm.provision :shell, :inline => 'sudo aptitude -y install dnsmasq'
  
  # install tinkerballa
  config.vm.provision :shell, :inline => 'sudo ln -sb --suffix .bak /vagrant /var/tinkerballa'
  config.vm.provision :shell, :inline => 'sudo /var/tinkerballa/bin/install.sh'
end

