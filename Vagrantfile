# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure(2) do |config|
  NodeCount = 2

  # Kubernetes Worker Nodes
  (1..NodeCount).each do |i|
    config.vm.define "ansible#{i}" do |workernode|
      workernode.vm.box = "bento/ubuntu-18.04"
      workernode.vm.hostname = "ansible#{i}.example.com"
      workernode.vm.network "private_network", ip: "172.42.42.21#{i}"
      workernode.vm.provider "virtualbox" do |v|
        v.name = "ansible#{i}"
        v.memory = 1024
        v.cpus = 1
      end
    end
  end

end
