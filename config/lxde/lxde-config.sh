#!/bin/bash

extralink="https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config"

#Get the necessary components
sudo apt-get update

sudo apt-get install lxde-core lxterminal lxappearance --no-install-recommends -y
sudo apt-get clean

mkdir -p ~/.vnc
chmod +x /usr/local/bin/startvnc
chmod +x /usr/local/bin/stopvnc

echo "export DISPLAY=":1"" >> /etc/profile
source /etc/profile

vncpasswd

wget --tries=20 $extralink/lxde/lxde-themes-config.sh
chmod +x  lxde-themes-config.sh
bash lxde-themes-config.sh
