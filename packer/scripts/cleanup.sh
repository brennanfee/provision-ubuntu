#!/usr/bin/env bash

echo "Cleaning up APT"
apt-get -y autoremove
apt-get -y clean
