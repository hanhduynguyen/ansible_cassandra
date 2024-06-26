# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'rbconfig'
require 'yaml'
inventory = YAML.load_file("inventory.yml")

Vagrant.configure("2") do |config|
  N = 10
  (N..N).each do |machine_id|
    config.vm.box = "generic/centos7"
    #config.vm.box_url = "https://vagrantcloud.com/geerlingguy/boxes/ubuntu1604"
    config.vm.define "node#{machine_id}" do |machine|
      if Vagrant.has_plugin?("vagrant-vbguest") then
        machine.vbguest.auto_update = false
      end
      machine.vm.hostname = "node#{machine_id}"
      #machine.vm.network "private_network", ip: "192.168.56.2#{machine_id}"
      machine.vm.network "private_network", ip: inventory["all"]["hosts"]["node#{machine_id}"]["ansible_ssh_host"]
      machine.vm.synced_folder "/Users/duyhanhnguyen/.ssh/", "/root/keys"
      machine.vm.synced_folder "/Users/duyhanhnguyen/git/oracle/hanh/vagrant_ansible/vagrant/spin_new_os/shared_scripts", "/vagrant_scripts"
      

      config.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1500"]
        vb.cpus = 2
      end
      #if machine_id == N
      machine.vm.provision "shell", inline: <<-SHELL
        sh /vagrant_scripts/provision.sh
      SHELL
      #end
    end
  end
 
    # controller.vm.box = "centos/7"
    # controller.vm.network "private_network", ip: inventory["all"]["hosts"]["controller"]["ansible_ssh_host"]
    # node.vm.synced_folder "/Users/duyhanhnguyen/.ssh/", "/root/keys"
    # controller.vm.provider "virtualbox" do |vb|
    #   vb.customize ["modifyvm", :id, "--memory", "1024"]
    # end
    # controller.vm.provision "ansible" do |ansible|
    #   ansible.playbook = "cassandra/tasks/CassandraCluster.yml"
    #   ansible.verbose        = true
    #   ansible.install        = true
    #   ansible.limit          = "all" # or only "nodes" group, etc.
    #   ansible.inventory_path = "inventory.yml"
    # end
    
  # config.vm.define 'controller' do |controller|
  #   controller.vm.box = "generic/centos7"
  #   if Vagrant.has_plugin?("vagrant-vbguest") then
  #     controller.vbguest.auto_update = false
  #   end
  #   controller.vm.network "private_network", ip: inventory["all"]["hosts"]["controller"]["ansible_ssh_host"]
  #   controller.vm.synced_folder "/Users/duyhanhnguyen/.ssh", "/root/keys"
  #   controller.vm.synced_folder "/Users/duyhanhnguyen/git/oracle/hanh/vagrant_ansible/vagrant/spin_new_os/shared_scripts", "/vagrant_scripts"
  #   controller.vm.provider "virtualbox" do |vb|
  #     vb.customize ["modifyvm", :id, "--memory", "2048"]
  #   end
  #   controller.vm.provision "shell", inline: <<-SHELL
  #     sh /vagrant_scripts/provision.sh
  #   SHELL
  # end
end 