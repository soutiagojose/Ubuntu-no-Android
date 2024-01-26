#!/bin/bash

extralink="https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/main/config"

#Get the necessary components
sudo apt-get update

sudo apt-get install xfce4 xfce4-goodies xfce4-terminal xfce4-panel-profiles dbus-x11 --no-install-recommends -y
sudo apt-get clean

mkdir -p ~/.vnc

echo '#!/bin/bash
export PULSE_SERVER=127.0.0.1
export LANG
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
echo $$ > /tmp/xsession.pid
dbus-launch --exit-with-session /usr/bin/startxfce4' > ~/.vnc/xstartup

chmod +x ~/.vnc/xstartup

## Seletor de idiomas
export USER=$(whoami)
HEIGHT=0
WIDTH=0
CHOICE_HEIGHT=5
TITLE="Select"
MENU="Escolha algumas das seguintes opções: \n \nChoose any of the following options: "
export PORT=1

OPTIONS=(1 "Português (Brasil)")

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
sed -i '\|export PULSE_SERVER=127.0.0.1|a LANG=pt_BR.UTF-8|' ~/.vnc/xstartup
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
