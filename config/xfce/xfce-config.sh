#!/bin/bash

extralink="https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config"

wget --tries=20 "$extralink/config.sh" -O $folder/root/config.sh
wget --tries=20 "$extralink/pacotes.sh"

chmod +x config.sh
chmod +x pacotes.sh

bash config.sh

clear
echo -e  "\033[0;32mXFCE UI\033[0m"
echo -e "




"
echo -e "




"
echo -e "




"

# Instalar pacotes necessários da interface
sudo apt-get install lxde-core lxterminal lxappearance --no-install-recommends -y
sudo apt-get clean

# Pasta resposável pela execução do vnc
mkdir -p ~/.vnc

echo "#!/bin/bash
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
export PULSE_SERVER=127.0.0.1
export LANG
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
echo $$ > /tmp/xsession.pid
dbus-launch --exit-with-session /usr/bin/startxfce4" > ~/.vnc/xstartup

chmod +x ~/.vnc/xstartup


## Seletor de idiomas
export USER=$(whoami)
HEIGHT=0
WIDTH=0
CHOICE_HEIGHT=5
TITLE="Select"
MENU="Escolha algumas das seguintes opções: \n \nChoose any of the following options: "
export PORT=1

OPTIONS=(1 "Português (Brasil)")

CHOICE=$(dialog --clear \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
1)
clear
echo -e  "\033[0;32mVocê escolheu o idioma Português Brasileiro\033[0m"
echo "As configurações de idioma já serão instaladas..."

# Mudar o idioma para o Português Brasileiro [pt_BR]
sudo apt-get install locales language-pack-pt language-pack-pt-base language-pack-gnome-pt language-pack-gnome-pt-base -y

## Gerar o idioma
sed -i 's/^# *\(pt_BR.UTF-8\)/\1/' /etc/locale.gen
locale-gen

## Exportar os comandos de configuração de idioma para ~/.bashrc
## Essa configuração necessita de reboot
echo 'export LC_ALL=pt_BR.UTF-8' >> ~/.bashrc
echo 'export LANG=pt_BR.UTF-8' >> ~/.bashrc
echo 'export LANGUAGE=pt_BR.UTF-8' >> ~/.bashrc

# Arquivos necessários para a tradução do VNC
wget --tries=20 "$extralink/pt_br/tigervnc/vnc" -P /usr/local/bin > /dev/null
wget --tries=20 "$extralink/pt_br/tigervnc/vncpasswd" -P /usr/local/bin > /dev/null
wget --tries=20 "$extralink/pt_br/tigervnc/stopvnc" -P /usr/local/bin > /dev/null
wget --tries=20 "$extralink/pt_br/tigervnc/lxde/startvnc" -P /usr/local/bin > /dev/null
wget --tries=20 "$extralink/pt_br/tigervnc/lxde/startvncserver" -P /usr/local/bin > /dev/null
sed -i 's|export LANG|LANG=pt_BR.UTF-8\nexport LANG|' ~/.vnc/xstartup
;;
2)
sed -i 's|export LANG|LANG=en_US.UTF-8\nexport LANG|' ~/.vnc/xstartup
;;
esac

if [ -e /usr/local/bin/vnc ]; then
  echo ""
else
  wget --tries=20 "$extralink/tigervnc/vnc" -P /usr/local/bin > /dev/null

    # Verificar se o download foi bem-sucedido
    if [ $? -eq 0 ]; then
        echo "Download concluído com sucesso."
    else
        echo "Erro ao baixar o arquivo vnc."
    fi
fi

if [ -e /usr/local/bin/startvnc ]; then
  echo ""
else
  wget --tries=20 "$extralink/tigervnc/startvnc" -P /usr/local/bin > /dev/null

    # Verificar se o download foi bem-sucedido
    if [ $? -eq 0 ]; then
        echo "Download concluído com sucesso."
    else
        echo "Erro ao baixar o arquivo startvnc."
    fi
fi

if [ -e /usr/local/bin/startvncserver ]; then
  echo ""
else
  wget --tries=20 "$extralink/tigervnc/startvncserver" -P /usr/local/bin > /dev/null

    # Verificar se o download foi bem-sucedido
    if [ $? -eq 0 ]; then
        echo "Download concluído com sucesso."
    else
        echo "Erro ao baixar o arquivo startvncserver."
    fi
fi

if [ -e /usr/local/bin/stopvnc ]; then
  echo ""
else
  wget --tries=20 "$extralink/tigervnc/stopvnc" -P /usr/local/bin > /dev/null

    # Verificar se o download foi bem-sucedido
    if [ $? -eq 0 ]; then
        echo "Download concluído com sucesso."
    else
        echo "Erro ao baixar o arquivo stopvnc."
    fi
fi

if [ -e /usr/local/bin/vncpasswd ]; then
  echo ""
else
  wget --tries=20 "$extralink/tigervnc/vncpasswd" -P /usr/local/bin > /dev/null

    # Verificar se o download foi bem-sucedido
    if [ $? -eq 0 ]; then
        echo "Download concluído com sucesso."
    else
        echo "Erro ao baixar o arquivo vncpasswd."
    fi
fi

chmod +x /usr/local/bin/startvnc
chmod +x /usr/local/bin/startvncserver
chmod +x /usr/local/bin/stopvnc
chmod +x /usr/local/bin/vnc
chmod +x /usr/local/bin/vncpasswd


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

bash pacotes.sh