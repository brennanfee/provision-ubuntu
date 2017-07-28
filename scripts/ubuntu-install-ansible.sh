#!/usr/bin/env bash
# ubuntu-install-ansible.sh - Tiny script to do the minimal installation
# required to get a pip installed Ansible.
#

# Bash "strict" mode
set -euo pipefail
IFS=$'\n\t'

# Update
echo "Updating Apt Cache"
apt-get update

# Install Python
apt-get install -y curl python-dev python3-dev libkrb5-dev libssl-dev libffi-dev

# Download pip install script
curl -fsSL https://bootstrap.pypa.io/get-pip.py -o "/tmp/get-pip.py"

# Install Pip3
if [[ ! -x "/usr/local/bin/pip3" ]]; then
    python3 /tmp/get-pip.py
fi

# Install Pip2
if [[ ! -x "/usr/local/bin/pip2" ]]; then
    python2 /tmp/get-pip.py
fi

# Install Ansible
/usr/local/bin/pip2 install ansible kerberos pywinrm
