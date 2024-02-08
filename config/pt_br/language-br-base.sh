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

sed -i 's|export LANG|export LANG=pt_BR.UTF-8\nexport LANG|' ~/.vnc/xstartup
# Arquivos necessários para a tradução do VNC

if [ ! -e "/usr/local/bin/startvncserver" ]; then
    wget --tries=20 "$extralink/pt_br/tigervnc/startvncserver" -P ubuntu22-fs/usr/local/bin > /dev/null
    chmod +x ubuntu22-fs/usr/local/bin/startvncserver
fi

