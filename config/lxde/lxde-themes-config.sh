#!/bin/bash

extralink="https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config"



vncserver -name remote-desktop -geometry 1920x1080 :1


#Configurações do painel
if [ ! -d "$HOME/.config/lxpanel/" ];then
  mkdir -p "$HOME/.config/lxpanel/"
fi

# Customização do painel xfce

wget "$extralink/lxde/lxpanel.tar.gz"
tar -xf lxpanel.tar.xz -C $HOME/.config/ lxpanel

# Definir o papel de parede
#pcmanfm --set-wallpaper /usr/share/backgrounds/john-towner-JgOeRuGD_Y4.jpg --wallpaper-mode stretch

#Definir tema
sed -i 's/ThemeName=.*/ThemeName=ZorinBlue-Dark/' ~/.config/lxsession/LXDE/desktop.conf

# Definir pacote de ícones
sed -i 's/IconThemeName=.*/IconThemeName=Uos-fulldistro-icons/' ~/.config/lxsession/LXDE/desktop.conf

vncserver -kill
rm -rf /tmp/.X$pt-lock
rm -rf /tmp/.X11-unix/X$pt
rm -rf xfce4-panel.tar.bz2
rm -rf Uos-fulldistro-icons.tar.xz
