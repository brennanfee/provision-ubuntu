#!/usr/bin/env bash
# ubuntu-ansible-bootstrap.sh - This script should do the absolute minimum to
# get a machine prepared to be called from Ansible.  It also installs the public
# SSH key needed for my personal Ansible setup.  Obviously, if you are going
# to use this script you will likely need to change that line and the password
# for the Ansible account.
#
# NOTE: This script is uploaded to a Gist and should be called from there.  I
# generally use bit.ly to create a short URL for the script and use that.  For
# instance this script can be locally executed with:
#
# curl -fsSL https://bit.ly/29fr6OQ | sudo -E /bin/bash
#

# Bash "strict" mode
set -euo pipefail
IFS=$'\n\t'

# Update
echo "Updating Apt Cache"
apt-get update

# Install the base tasks
echo "Installing base tasks"
tasksel install server
tasksel install standard
tasksel install openssh-server

# Install base packages
echo "Installing base packages"
apt-get -y install sudo acl build-essential dkms vim-nox curl git aptitude python python3 plymouth-themes plymouth-label

# Upgrading packages
echo "Upgrading packages"
apt-get -y dist-upgrade
apt-get -y autoremove

# Create the Ansible user
echo "Adding Ansible user"
useradd --create-home --password '$6$zIkweK1QYw2kkCTJ$mc8tOO3s2AbvkNwpwDrx7YT/djmRDoXGY1w6YOaPFtNCPVkdDvCRrBCVa.tmqh7XCsFptfW29tr3qW77P0jal/' --shell "/bin/bash" --comment "Ansible Account" -U ansible
mkdir /home/ansible/.ssh
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINP5tWGHH7ncz29O2uixhmk2cu5AAynPtJS2Jlp+m9CF ansible@tts.lan" > /home/ansible/.ssh/authorized_keys
chown -R ansible /home/ansible/.ssh
chmod -R go-rwsx /home/ansible/.ssh

usermod -a -G ssh ansible
usermod -a -G sudo ansible

echo "Finished"
