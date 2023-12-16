#!/bin/bash

extralink="https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config"



vncserver -name remote-desktop -geometry 1920x1080 :1


#Configurações do painel
#if [ ! -d "$HOME/.config/lxpanel/" ];then
#  mkdir -p "$HOME/.config/lxpanel/"
#fi

# Customização do painel xfce

wget "$extralink/lxde/lxpanel.tar.xz"
wget "$extralink/lxde/lxsession.tar.xz"
tar -xf lxpanel.tar.xz -C $HOME/.config/ lxpanel
tar -xf lxsession.tar.xz -C $HOME/.config/ lxsession

# Definir o papel de parede
#pcmanfm --set-wallpaper /usr/share/backgrounds/john-towner-JgOeRuGD_Y4.jpg --wallpaper-mode stretch
sed -i 's|wallpaper=/etc/alternatives/desktop-background|wallpaper=/usr/share/backgrounds/john-towner-JgOeRuGD_Y4.jpg|' ~/.config/pcmanfm/LXDE/desktop-items-0.conf

#Definir tema
#sed -i 's|sNet/ThemeName=*|sNet/ThemeName=ZorinBlue-Dark|' ~/.config/lxsession/LXDE/desktop.conf

# Definir pacote de ícones
#sed -i 's|sNet/IconThemeName=*|sNet/IconThemeName=Uos-fulldistro-icons/' ~/.config/lxsession/LXDE/desktop.conf

vncserver -kill
rm -rf /tmp/.X$pt-lock
rm -rf /tmp/.X11-unix/X$pt
rm -rf xfce4-panel.tar.bz2
rm -rf Uos-fulldistro-icons.tar.xz
