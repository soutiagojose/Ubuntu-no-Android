#!/bin/bash

#Get the necessary components
sudo apt-get update

sudo apt-get install xfce4 xfce4-goodies xfce4-terminal xfce4-panel-profiles dbus-x11 --no-install-recommends -y
sudo apt-get clean

# Baixando papel de parede
wget https://raw.githubusercontent.com/allytiago/start-setup-ubuntu-andronix/main/setup/wallpapers/unsplash/john-towner-JgOeRuGD_Y4.jpg
mv john-towner-JgOeRuGD_Y4.jpg /usr/share/backgrounds/

# Customização do painel xfce
wget https://github.com/allytiago/Ubuntu-no-Android/raw/main/config/xfce4/xfce4-panel.tar.bz2

# Instalação do pacote de icones
wget https://github.com/allytiago/Ubuntu-no-Android/raw/main/config/icons/Uos-fulldistro-icons.tar.xz
tar -xf Uos-fulldistro-icons.tar.xz -C /usr/share/icons

export USER=$(whoami)
export PORT=1
GEO="-geometry 1920x1080" vnc
vncserver -name remote-desktop -geometry 1920x1080 :1

sed -i 's|backgrounds/xfce/xfce-verticals.png|backgrounds/john-towner-JgOeRuGD_Y4.jpg|' $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml

echo "Definindo o tema"
echo ""
echo ""
xfconf-query -c xsettings -p /Net/ThemeName -s ZorinBlue-Dark
echo "Definindo o pacote de icons"
echo ""
echo ""
xfconf-query -c xsettings -p /Net/IconThemeName -s Uos-fulldistro-icons
echo "Definindo o painel de menus"
echo ""
echo ""
xfce4-panel-profiles load xfce4-panel.tar.bz2
echo ""
echo ""



vncserver -kill
rm -rf /tmp/.X$pt-lock
rm -rf /tmp/.X11-unix/X$pt
rm -rf xfce4-panel.tar.bz2
rm -rf Uos-fulldistro-icons.tar.xz
