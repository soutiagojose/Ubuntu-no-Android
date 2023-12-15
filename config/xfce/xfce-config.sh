#!/bin/bash

#Get the necessary components
sudo apt-get update

sudo apt-get install xfce4 xfce4-goodies xfce4-terminal xfce4-panel-profiles dbus-x11 --no-install-recommends -y
sudo apt-get clean


## Seletor de idiomas
export USER=$(whoami)
HEIGHT=0
WIDTH=0
CHOICE_HEIGHT=5
TITLE="Select"
MENU="Escolha algumas das seguintes opções: \n \nChoose any of the following options: "
export PORT=1

OPTIONS=(1 "Português (brasileiro)")

CHOICE=$(dialog --clear \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
1)
wget $extralink/pt_br/config.sh -O locale-config.sh
wget $extralink/pt_br/tigervnc/xfce/locale.sh
;;
esac


#mkdir -p ~/.vnc
chmod +x /usr/local/bin/startvnc
chmod +x /usr/local/bin/stopvnc


vncpasswd


wget --tries=20 $extralink/xfce/xfce4-themes-config.sh
chmod +x  xfce4-themes-config.sh
bash xfce4-themes-config.sh

