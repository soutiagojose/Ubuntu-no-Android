#!/bin/bash

vncserver -name remote-desktop -geometry 1920x1080 :1
echo -e "


















"
xfconf-query -c xsettings -p /Net/ThemeName -s ZorinBlue-Dark
xfconf-query -c xsettings -p /Net/IconThemeName -s Uos-fulldistro-icons
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVNC-0/workspace0/last-image -s /usr/share/backgrounds/john-towner-JgOeRuGD_Y4.jpg
xfce4-panel-profiles load xfce4-panel.tar.bz2
mkdir $HOME/.config/gtk-3.0/
echo 'file:///sdcard' | sudo tee $HOME/.config/gtk-3.0/bookmarks

#mkdir $HOME/.config/xfce4/
#mkdir $HOME/.config/xfce4/xconf
#mkdir $HOME/.config/xfce4/xconf/xfce-perchannel-xml

# Certificação para caso de erro

xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVNC-0/workspace0/last-image -s /usr/share/backgrounds/john-towner-JgOeRuGD_Y4.jpg
#sed -i 's|property name="last-image" type="string" value="/usr/share/backgrounds/xfce/xfce-verticals.png"property name="last-image" type="string" value="/usr/share/backgrounds/john-towner-JgOeRuGD_Y4.jpg"|' $HOME/.config/xfce4/xconf/xfce-perchannel-xml/xfce4-desktop.xml

vncserver -kill
rm -rf /root/.vnc/localhost:5901.pid
rm -rf /tmp/.X$pt-lock
rm -rf /tmp/.X11-unix/X$pt
rm -rf xfce4-panel.tar.bz2
rm -rf Uos-fulldistro-icons.tar.xz

