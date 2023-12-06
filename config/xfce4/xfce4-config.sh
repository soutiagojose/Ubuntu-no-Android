#!/bin/bash

#Get the necessary components
sudo apt-get update

sudo apt-get install xfce4 xfce4-goodies xfce4-terminal xfce4-panel-profiles dbus-x11 --no-install-recommends -y
sudo apt-get clean

wget --tries=20 https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/main/config/xfce4/xfce4-themes-config.sh
chmod +x  xfce4-themes-config.sh
bash xfce4-themes-config.sh

vncpasswd
