#!/bin/bash

#GUI Idiomas
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
            echo "Você escolheu o idioma Português Brasileiro"
            wget --tries=20 $extralink/pt_br/config.sh -O $folder/root/lang-config.sh
	    wget --tries=20 $extralink/pt_br/tigervnc/vnc -P /usr/local/bin > /dev/null
            wget --tries=20 $extralink/pt_br/tigervnc/vncpasswd -P /usr/local/bin > /dev/null
            wget --tries=20 $extralink/pt_br/tigervnc/stopvnc -P /usr/local/bin > /dev/null
            if dpkg -l | grep -q lxde-core; then
              wget --tries=20  $extralink/pt_br/tigervnc/lxde/startvnc -P /usr/local/bin > /dev/null
	    elif dpkg -l | grep -q xfce4; then
              wget --tries=20  $extralink/pt_br/tigervnc/xfce/startvnc -P /usr/local/bin > /dev/null
	    else
	      echo 'Não identifiquei a interface'
	    fi
            clear
            ;;
esac

chmod +x /usr/local/bin/vnc
chmod +x /usr/local/bin/vncpasswd
chmod +x /usr/local/bin/startvnc
chmod +x /usr/local/bin/stopvnc
