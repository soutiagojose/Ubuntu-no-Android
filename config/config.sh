#!/bin/bash

# Corrige
sed -i 's|#command+=" -b system_bus_socket:/run/dbus/system_bus_socket"|command+=" -b system_bus_socket:/run/dbus/system_bus_socket"|' /data/data/com.termux/files/home/start-ubuntu.sh

extralink="https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config"
wget --tries=20 "$extralink/pacotes.sh"
chmod +x pacotes.sh

# Atualizar lista e pacotes
sudo apt-get update
sudo apt-get full-upgrade -y

# Instalar pacotes necessários
sudo apt-get install sudo wget nano dialog inetutils-tools dbus-x11 -y
sudo apt-get install keyboard-configuration -y
clear
sudo apt-get install tzdata -y #dpkg-reconfigure tzdata
clear
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

bash language-base.sh
bash pacotes.sh

rm -rf config.sh
rm -rf pacotes.sh
rm -rf language-base.sh


#Error: GDBus.Error:org.freedesktop.DBus.Error.ServiceUnknown: The name org.freedesktop.PackageKit was not provided by any .service files