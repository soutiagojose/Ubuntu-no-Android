#!/bin/bash

extralink="https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config"

wget --tries=20 "$extralink/config.sh"
wget --tries=20 "$extralink/pacotes.sh"

chmod +x config.sh
chmod +x pacotes.sh

bash config.sh

clear
echo -e  "\033[0;32mGnome UI\033[0m"
echo -e "




"
echo -e "




"
echo -e "




"
clear
# Instalar pacotes necessários da interface
sudo apt-get install gnome-shell gnome-terminal gnome-tweaks gnome-shell-extensions gnome-shell-extension-ubuntu-dock -y
sudo apt-get clean