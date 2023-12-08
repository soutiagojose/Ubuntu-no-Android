#!/bin/bash

#Get the necessary components
sudo apt-get update

sudo apt-get install lxde-core lxterminal --no-install-recommends -y
sudo apt-get clean

mkdir -p ~/.vnc
chmod +x /usr/local/bin/startvnc
chmod +x /usr/local/bin/stopvnc

echo "export DISPLAY=":1"" >> /etc/profile
source /etc/profile

vncpasswd
