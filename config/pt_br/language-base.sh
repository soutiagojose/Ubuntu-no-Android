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

if [ ! -f /usr/local/bin/startvncserver ]; then
    echo -e  "\033[42m =========================================================== \033[0m"
    wget --tries=20 "$extralink/pt_br/tigervnc/startvncserver" -P usr/local/bin > /dev/null
    chmod +x usr/local/bin/startvncserver
fi

