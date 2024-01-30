#!/bin/bash

extralink="https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/main/config"

# Atualizar lista e pacotes
sudo apt-get update
sudo apt-get full-upgrade -y

# Instalar pacotes necessários
sudo apt-get install sudo -y
sudo apt-get install wget -y
sudo apt-get install nano -y
sudo apt-get install dialog -y
sudo apt-get install inetutils-tools -y
sudo apt-get install dbus-x11 -y
sudo apt-get install exo-utils --no-install-recommends -y
sudo apt-get install tigervnc-standalone-server tigervnc-common tigervnc-tools --no-install-recommends -y
#sudo apt install udisks2 -y
#echo "" > /var/lib/dpkg/info/udisks2.postinst
#sudo dpkg --configure -a
#sudo apt-mark hold udisks2

# Baixando papel de parede
if [ ! -d "/usr/share/backgrounds/" ];then
  mkdir -p "/usr/share/backgrounds/"
fi

wget --tries=20 "$extralink/wallpapers/unsplash/john-towner-JgOeRuGD_Y4.jpg" -P /usr/share/backgrounds

# Baixando pacote de icones
if [ ! -d "/usr/share/icons" ];then
  mkdir -p "/usr/share/icons"
fi

wget --tries=20 "$extralink/icons/Uos-fulldistro-icons.tar.xz" -P /usr/share/icons

tar -xf Uos-fulldistro-icons.tar.xz -C /usr/share/icons