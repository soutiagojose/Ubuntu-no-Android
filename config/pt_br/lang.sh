#!/bin/bash

extralink="https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config"

echo "Você escolheu o idioma Português Brasileiro"
wget --tries=20 $extralink/pt_br/config.sh -O $folder/root/lang-config.sh
wget --tries=20 $extralink/pt_br/tigervnc/vnc -P /usr/local/bin > /dev/null
wget --tries=20 $extralink/pt_br/tigervnc/vncpasswd -P /usr/local/bin > /dev/null
wget --tries=20 $extralink/pt_br/tigervnc/stopvnc -P /usr/local/bin > /dev/null

if dpkg -s lxde-core >/dev/null 2>&1; then
    wget --tries=20 "$extralink/pt_br/tigervnc/lxde/startvnc" -P /usr/local/bin > /dev/null
elif dpkg -s xfce4 >/dev/null 2>&1; then
    wget --tries=20 "$extralink/pt_br/tigervnc/xfce/startvnc" -P /usr/local/bin > /dev/null
else
    echo "Nenhum dos pacotes lxde-core ou xfce4 está instalado."
fi

