#!/bin/bash
# Customização do painel xfce
wget https://github.com/allytiago/Ubuntu-no-Android/raw/main/config/xfce4/xfce4-panel.tar.bz2

vncserver -name remote-desktop -geometry 1920x1080 :1
xfconf-query -c xsettings -p /Net/ThemeName -s ZorinBlue-Dark
xfconf-query -c xsettings -p /Net/IconThemeName -s Uos-fulldistro-icons
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVNC-0/workspace0/last-image -s /usr/share/backgrounds/john-towner-JgOeRuGD_Y4.jpg
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVNC-0/workspace0/last-image -s /usr/share/backgrounds/john-towner-JgOeRuGD_Y4.jpg
xfce4-panel-profiles load xfce4-panel.tar.bz2
xfce4-panel-profiles load xfce4-panel.tar.bz2

rm -rf xfce4-panel.tar.bz2
rm -rf Uos-fulldistro-icons.tar.xz

vncserver -kill
rm -rf /tmp/.X$pt-lock
rm -rf /tmp/.X11-unix/X$pt
