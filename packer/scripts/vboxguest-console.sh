#!/usr/bin/env bash

# Bash "strict" mode
set -euo pipefail
IFS=$'\n\t'

apt-get update
apt-get install -y --no-install-recommends --reinstall virtualbox-guest-utils virtualbox-guest-dkms

vagrant_user_exists=$(id -u vagrant > /dev/null 2>&1; echo $?)
if [[ "$vagrant_user_exists" -eq "1" ]]; then
  usermod -a -G vboxsf vagrant
fi
