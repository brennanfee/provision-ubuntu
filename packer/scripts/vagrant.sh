#!/usr/bin/env bash

date | sudo tee /etc/vagrant_box_build_time

# Install vagrant ssh key
mkdir /home/vagrant/.ssh
wget --no-check-certificate -O /home/vagrant/.ssh/authorized_keys 'https://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub'
chown -R vagrant /home/vagrant/.ssh
chmod -R go-rwsx /home/vagrant/.ssh

# Add vagrant user to passwordless sudo
echo 'Defaults:vagrant !requiretty' > /etc/sudoers.d/vagrant
echo 'vagrant ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers.d/vagrant
chmod 440 /etc/sudoers.d/vagrant

# Add vagrant user to the ssh and sudo groups
usermod -a -G ssh vagrant
usermod -a -G sudo vagrant
