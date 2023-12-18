#!/bin/bash

extralink="https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config"

#Get the necessary components
sudo apt-get update

sudo apt-get install xfce4 xfce4-goodies xfce4-terminal xfce4-panel-profiles dbus-x11 --no-install-recommends -y
sudo apt-get clean

mkdir -p ~/.vnc

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
wget --tries=20 $extralink/pt_br/tigervnc/xfce/locale.sh
wget --tries=20 $extralink/pt_br/config.sh -O locale-config.sh
wget --tries=20 $extralink/pt_br/tigervnc/xfce/startvncserver -P /usr/local/bin > /dev/null
bash locale.sh
bash locale-config.sh
;;
esac

chmod +x /usr/local/bin/startvnc
chmod +x /usr/local/bin/stopvnc
chmod +x /usr/local/bin/startvncserver

echo "export DISPLAY=":1"" >> /etc/profile
source /etc/profile

vncpasswd

wget --tries=20 $extralink/xfce/xfce4-themes-config.sh
chmod +x  xfce4-themes-config.sh
bash xfce4-themes-config.sh

rm -rf locale.sh
rm -rf locale-config.sh
