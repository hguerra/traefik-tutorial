Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/xenial64'
  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', '4048']
  end

  config.vm.synced_folder 'devenv/', '/home/vagrant/devenv', create: true
  config.vm.define :server_dev do |dev_config|
    dev_config.vm.network 'forwarded_port', guest: 80, host: 8080
    dev_config.vm.network 'forwarded_port', guest: 443, host: 8081
    dev_config.vm.provision 'shell', path: 'manifests/bootstrap.sh', privileged: false
  end
end
