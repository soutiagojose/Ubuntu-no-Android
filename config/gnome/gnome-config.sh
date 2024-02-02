#!/bin/bash

extralink="https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config"

wget --tries=20 "https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config/config.sh"
wget --tries=20 "https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config/pacotes.sh"

chmod +x config.sh
chmod +x pacotes.sh

bash config.sh

clear
echo -e  "\033[0;32mGnome UI\033[0m"
echo -e "




"
echo -e "




"
echo -e "




"
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
service dbus start
gnome-shell --x11" > ~/.vnc/xstartup

chmod +x ~/.vnc/xstartup
for file in $(find /usr -type f -iname "*login1*"); do rm -rf $file 
done

## Seletor de idiomas
export USER=$(whoami)
HEIGHT=0
WIDTH=0
CHOICE_HEIGHT=5
TITLE="Select"
MENU="Escolha algumas das seguintes opções: \n \nChoose any of the following options: "
export PORT=1

OPTIONS=(1 "Português (brasileiro)"
         2 "Default (en_US)")

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
### Essa configuração necessita de reboot
echo 'export LC_ALL=pt_BR.UTF-8' >> ~/.bashrc
echo 'export LANG=pt_BR.UTF-8' >> ~/.bashrc
echo 'export LANGUAGE=pt_BR.UTF-8' >> ~/.bashrc

# Arquivos necessários para a tradução do VNC
wget --tries=20 "https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config/pt_br/tigervnc/vnc" -P /usr/local/bin > /dev/null
wget --tries=20 "https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config/pt_br/tigervnc/vncpasswd" -P /usr/local/bin > /dev/null
wget --tries=20 "https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config/pt_br/tigervnc/stopvnc" -P /usr/local/bin > /dev/null
wget --tries=20 "https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config/pt_br/tigervnc/startvnc" -P /usr/local/bin > /dev/null
wget --tries=20 "https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config/pt_br/tigervnc/startvncserver" -P /usr/local/bin > /dev/null
sed -i 's|export LANG|LANG=pt_BR.UTF-8\nexport LANG|' ~/.vnc/xstartup
;;
2)
sed -i 's|export LANG|LANG=en_US.UTF-8\nexport LANG|' ~/.vnc/xstartup
;;
esac

if [ -e /usr/local/bin/vnc ]; then
  echo ""
else
  wget --tries=20 "https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config/tigervnc/vnc" -P /usr/local/bin > /dev/null

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
  wget --tries=20 "https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config/tigervnc/startvnc" -P /usr/local/bin > /dev/null

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
  wget --tries=20 "https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config/tigervnc/startvncserver" -P /usr/local/bin > /dev/null

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
  wget --tries=20 "https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config/tigervnc/stopvnc" -P /usr/local/bin > /dev/null

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
  wget --tries=20 "https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config/tigervnc/vncpasswd" -P /usr/local/bin > /dev/null

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
