#!/bin/bash

extralink="https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config"

wget --tries=20 "$extralink/config.sh" -O $folder/root/config.sh
chmod +x config.sh
bash config.sh
clear

echo -e  "\033[0;32mXFCE UI\033[0m"

# Instalar pacotes necessários da interface
sudo apt-get install lxde-core lxterminal lxappearance --no-install-recommends -y
sudo apt-get clean

# Pasta resposável pela execução do vnc
mkdir -p ~/.vnc

echo "#!/bin/bash
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
export PULSE_SERVER=127.0.0.1
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
echo $$ > /tmp/xsession.pid
dbus-launch --exit-with-session /usr/bin/startxfce4" > ~/.vnc/xstartup

chmod +x ~/.vnc/xstartup


echo "export DISPLAY=":1"" >> /etc/profile
source /etc/profile

vncpasswd

# Configuração do tema
vncserver -name remote-desktop -geometry 1920x1080 :1

mkdir $HOME/.config/gtk-3.0/

#Adicionar o atalho da memória interna do aparelho nos gerenciadores de arquivos
echo 'file:///sdcard' | sudo tee $HOME/.config/gtk-3.0/bookmarks

## Tema dark
xfconf-query -c xsettings -p /Net/ThemeName -s ZorinBlue-Dark
# Pacote de icones
xfconf-query -c xsettings -p /Net/IconThemeName -s Uos-fulldistro-icons
## papel de parede
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVNC-0/workspace0/last-image -s /usr/share/backgrounds/john-towner-JgOeRuGD_Y4.jpg

# Estilo do painel
wget --tries=20 $extralink/xfce/xfce4-panel.tar.bz2 $folder/root/xfce4-panel.tar.bz2
chmod +x ./xfce4-panel.tar.bz2
xfce4-panel-profiles load xfce4-panel.tar.bz2

vncserver -kill
rm -rf /root/.vnc/localhost:5901.pid
rm -rf /tmp/.X$pt-lock
rm -rf /tmp/.X11-unix/X$pt
rm -rf xfce4-panel.tar.bz2
rm -rf Uos-fulldistro-icons.tar.xz