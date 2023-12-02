export USER=$(whoami)
export PORT=1
GEO="-geometry 1920x1080" vnc
vncserver -name remote-desktop -geometry 1920x1080 :1

xfce4-panel-profiles load xfce4-panel.tar.bz2
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVNC-0/workspace0/last-image -s  /usr/share/backgrounds/john-towner-JgOeRuGD_Y4.jpg
