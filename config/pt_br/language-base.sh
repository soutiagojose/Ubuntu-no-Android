#!/bin/bash
extralink="https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config"

sudo apt-get install locales language-pack-pt language-pack-pt-base language-pack-gnome-pt language-pack-gnome-pt-base -y

## Gerar o idioma
#sed -i 's/^# *\(pt_BR.UTF-8\)/\1/' /etc/locale.gen
locale-gen

## Exportar os comandos de configuração de idioma para ~/.bashrc
### Essa configuração necessita de reboot
echo 'export LC_ALL=pt_BR.UTF-8' >> ~/.bashrc
echo 'export LANG=pt_BR.UTF-8' >> ~/.bashrc
echo 'export LANGUAGE=pt_BR.UTF-8' >> ~/.bashrc

# Arquivos necessários para a tradução do VNC
wget --tries=20 "$extralink/pt_br/tigervnc/vnc" -P /usr/local/bin > /dev/null
wget --tries=20 "$extralink/pt_br/tigervnc/vncpasswd" -P /usr/local/bin > /dev/null
wget --tries=20 "$extralink/pt_br/tigervnc/stopvnc" -P /usr/local/bin > /dev/null
wget --tries=20 "$extralink/pt_br/tigervnc/startvnc" -P /usr/local/bin > /dev/null
wget --tries=20 "$extralink/startvncserver" -P /usr/local/bin > /dev/null
#sed -i 's|export LANG|LANG=pt_BR.UTF-8\nexport LANG|' ~/.vnc/xstartup
chmod +x /usr/local/bin/startvnc
chmod +x /usr/local/bin/startvncserver
chmod +x /usr/local/bin/stopvnc
chmod +x /usr/local/bin/vnc
chmod +x /usr/local/bin/vncpasswd