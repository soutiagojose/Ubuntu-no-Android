#!/bin/bash

extralink="https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config"
# \e[32m greem

echo "\e[32mVocê escolheu o idioma Português Brasileiro \e[0m"

if [ ! -d "/usr/local/bin/vnc" ];then
  echo ""
else
  wget --tries=20 $extralink/pt_br/tigervnc/vnc -P /usr/local/bin > /dev/null
fi

if [ ! -d "/usr/local/bin/vncpasswd" ];then
  echo " "
else
  wget --tries=20 $extralink/pt_br/tigervnc/vncpasswd -P /usr/local/bin > /dev/null
fi

if [ ! -d "/usr/local/bin/stopvnc" ];then
  echo " "
else
  wget --tries=20 $extralink/pt_br/tigervnc/stopvnc -P /usr/local/bin > /dev/null
fi


if dpkg -l | grep -q lxde-core;then
  echo " "
else
    wget --tries=20 "$extralink/pt_br/tigervnc/lxde/startvnc" -P /usr/local/bin > /dev/null
fi

if dpkg -l | grep -q xfce4;then
  echo " "
else
    wget --tries=20 "$extralink/pt_br/tigervnc/xfce/startvnc" -P /usr/local/bin > /dev/null
fi
