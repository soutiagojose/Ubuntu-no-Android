#!/bin/bash

extralink="https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config"

wget --tries=20 "https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config/config.sh"
#wget --tries=20 "https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config/pacotes.sh"

chmod +x config.sh
#chmod +x pacotes.sh

bash config.sh

clear
echo -e  "\033[0;32mGnome UI\033[0m"

clear
# Instalar pacotes necessários da interface
sudo apt-get install gnome-shell gnome-terminal gnome-tweaks gnome-shell-extensions gnome-shell-extension-ubuntu-dock -y
sudo apt-get install  yaru-theme-gtk yaru-theme-icon -y
sudo apt-get clean

# Pasta resposável pela execução do vnc
mkdir -p ~/.vnc
echo "#!/bin/bash
export PULSE_SERVER=127.0.0.1
export LANG
export XDG_CURRENT_DESKTOP="GNOME"
#service dbus start
gnome-shell --x11" > ~/.vnc/xstartup

chmod +x ~/.vnc/xstartup
#for file in $(find /usr -type f -iname "*login1*"); do rm -rf $file 
#done

echo "export DISPLAY=":1"" >> /etc/profile
source /etc/profile

vncpasswd
