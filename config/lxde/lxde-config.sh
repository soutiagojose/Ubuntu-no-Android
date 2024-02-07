#!/bin/bash

extralink="https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/main/config"

#Get the necessary components
sudo apt-get update

sudo apt-get install lxde-core lxterminal lxappearance --no-install-recommends -y
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
wget $extralink/pt_br/config.sh -O locale-config.sh
wget $extralink/pt_br/tigervnc/lxde/locale.sh
wget --tries=20 $extralink/pt_br/tigervnc/lxde/startvncserver -P /usr/local/bin > /dev/null
bash locale.sh
bash locale-config.sh
;;
esac

chmod +x /usr/local/bin/startvnc
chmod +x /usr/local/bin/startvncserver
chmod +x /usr/local/bin/stopvnc

echo "export DISPLAY=":1"" >> /etc/profile
source /etc/profile

vncpasswd

wget --tries=20 $extralink/lxde/lxde-themes-config.sh
chmod +x  lxde-themes-config.sh
bash lxde-themes-config.sh

rm -rf locale.sh
rm -rf locale-config.sh
rm -rf lxde-themes-config.sh
