#!/bin/bash

#Get the necessary components
sudo apt-get update

sudo apt-get install xfce4 xfce4-goodies xfce4-terminal xfce4-panel-profiles dbus-x11 --no-install-recommends -y
sudo apt-get clean

mkdir -p ~/.vnc
chmod +x /usr/local/bin/startvnc
chmod +x /usr/local/bin/stopvnc

echo "export DISPLAY=":1"" >> /etc/profile
source /etc/profile


vncpasswd


wget --tries=20 $extralink/xfce/xfce4-themes-config.sh
chmod +x  xfce4-themes-config.sh
bash xfce4-themes-config.sh

