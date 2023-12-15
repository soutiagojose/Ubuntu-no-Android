#!/bin/bash

extralink="https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config"

echo -e  "\033[0;32mVocê escolheu o idioma Português Brasileiro\033[0m"

wget --tries=20 "$extralink/pt_br/tigervnc/vnc" -P /usr/local/bin > /dev/null
wget --tries=20 "$extralink/pt_br/tigervnc/vncpasswd" -P /usr/local/bin > /dev/null
wget --tries=20 "$extralink/pt_br/tigervnc/stopvnc" -P /usr/local/bin > /dev/null
wget --tries=20 "$extralink/pt_br/tigervnc/xfce/startvnc" -P /usr/local/bin > /dev/null


chmod +x /usr/local/bin/vnc
chmod +x /usr/local/bin/vncpasswd
chmod +x /usr/local/bin/startvnc
chmod +x /usr/local/bin/stopvnc
