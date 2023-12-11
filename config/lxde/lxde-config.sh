#!/bin/bash

#Get the necessary components
sudo apt-get update

sudo apt-get install lxde-core lxterminal lxappearance --no-install-recommends -y
sudo apt-get clean

mkdir -p ~/.vnc
chmod +x /usr/local/bin/startvnc
chmod +x /usr/local/bin/stopvnc

echo "export DISPLAY=":1"" >> /etc/profile
source /etc/profile

https://github.com/allytiago/Ubuntu-no-Android/raw/beta/config/lxde/lxpanel.tar.gz
# Configurações de aparência

#Configurações do painel
if [ ! -d "$HOME/.config/lxpanel/" ];then
  mkdir -p "$HOME/.config/lxpanel/"
fi
wget https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config/lxde/lxpanel.tar.zx
tar -xf lxpanel.tar.xz -C $HOME/.config/ lxpanel
# Definir o papel de parede
pcmanfm --set-wallpaper /usr/share/backgrounds/john-towner-JgOeRuGD_Y4.jpg --wallpaper-mode stretch

#Definir tema
sed -i 's/ThemeName=.*/ThemeName=ZorinBlue-Dark/' ~/.config/lxsession/LXDE/desktop.conf

# Definir pacote de ícones
sed -i 's/IconThemeName=.*/IconThemeName=Uos-fulldistro-icons/' ~/.config/lxsession/LXDE/desktop.conf

vncpasswd
