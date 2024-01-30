#!/bin/bash

extralink="https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config"

wget --tries=20 "$extralink/config.sh"
wget --tries=20 "$extralink/pacotes.sh"

chmod +x config.sh
chmod +x pacotes.sh

bash config.sh

clear
echo -e  "\033[0;32mLXDE UI\033[0m"
echo -e "




"
echo -e "




"
echo -e "




"
clear

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
dbus-launch --exit-with-session startlxde" > ~/.vnc/xstartup

chmod +x ~/.vnc/xstartup


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
wget --tries=20 "$extralink/pt_br/tigervnc/vnc" -P /usr/local/bin > /dev/null
wget --tries=20 "$extralink/pt_br/tigervnc/vncpasswd" -P /usr/local/bin > /dev/null
wget --tries=20 "$extralink/pt_br/tigervnc/stopvnc" -P /usr/local/bin > /dev/null
wget --tries=20 "$extralink/pt_br/tigervnc/startvnc" -P /usr/local/bin > /dev/null
wget --tries=20 "$extralink/pt_br/tigervnc/startvncserver" -P /usr/local/bin > /dev/null
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

mkdir $HOME/.config/lxsession
mkdir $HOME/.config/lxsession/LXDE
mkdir $HOME/.config/gtk-3.0/

#Adicionar o atalho da memória interna do aparelho nos gerenciadores de arquivos
echo 'file:///sdcard' | sudo tee $HOME/.config/gtk-3.0/bookmarks


echo '[Command]
Logout=lxde-logout' | sudo tee $HOME/.config/lxpanel/LXDE/config

# Estilo do painel
echo '# lxpanel <profile> config file. Manually editing is not recommended.
# Use preference dialog in lxpanel to adjust config when you can.

Global {
  edge=top
  align=left
  margin=0
  widthtype=percent
  width=100
  height=48
  transparent=0
  tintcolor=#000000
  alpha=0
  setdocktype=1
  setpartialstrut=1
  autohide=0
  heightwhenhidden=0
  usefontcolor=1
  fontcolor=#ffffff
  background=0
  backgroundfile=/usr/share/lxpanel/images/background.png
}
Plugin {
  type=space
  Config {
    Size=20
  }
}
Plugin {
  type=menu
  Config {
    system {
    }
    separator {
    }
    item {
      command=run
    }
    separator {
    }
    item {
      command=logout
      image=gnome-logout
    }
    image=/usr/share/lxpanel/images/my-computer.png
  }
}
Plugin {
  type=space
  Config {
    Size=20
  }
}
Plugin {
  type=launchbar
  Config {
    Button {
      id=chromium-browser.desktop
    }
  }
}
Plugin {
  type=space
  Config {
    Size=20
  }
}
Plugin {
  type=taskbar
  Config {
    IconsOnly=0
    FlatButton=-1
    ShowAllDesks=-1
    UseMouseWheel=-1
    GroupedTasks=0
    DisableUpscale=0
    SameMonitorOnly=0
  }
}
Plugin {
  type=space
  Config {
  }
  expand=1
}
Plugin {
  type=dclock
  Config {
    ClockFmt=%D %R
    TooltipFmt=%A %x
    BoldFont=0
    IconOnly=0
    CenterText=0
  }
}
Plugin {
  type=space
  Config {
    Size=20
  }
}' | sudo tee $HOME/.config/lxpanel/LXDE/panels/panel


echo '@lxpanel --profile LXDE
@pcmanfm --desktop --profile LXDE
@xscreensaver -no-splash' | sudo tee $HOME/.config/lxsession/LXDE/autostart


echo '[Session]
window_manager=openbox-lxde
disable_autostart=no
polkit/command=
clipboard/command=lxclipboard
xsettings_manager/command=build-in
proxy_manager/command=build-in
keyring/command=ssh-agent
quit_manager/command=lxsession-logout
lock_manager/command=lxlock
terminal_manager/command=lxterminal
quit_manager/image=/usr/share/lxde/images/logout-banner.png
quit_manager/layout=top

[GTK]
sNet/ThemeName=ZorinBlue-Dark
sNet/IconThemeName=Uos-fulldistro-icons
sGtk/FontName=Sans 10
iGtk/ToolbarStyle=3
iGtk/ButtonImages=1
iGtk/MenuImages=1
iGtk/CursorThemeSize=18
iXft/Antialias=1
iXft/Hinting=1
sXft/HintStyle=hintslight
sXft/RGBA=rgb
iNet/EnableEventSounds=1
iNet/EnableInputFeedbackSounds=1
sGtk/ColorScheme=
iGtk/ToolbarIconSize=3
sGtk/CursorThemeName=DMZ-White

[Mouse]
AccFactor=20
AccThreshold=10
LeftHanded=0

[Keyboard]
Delay=500
Interval=30
Beep=1

[State]
guess_default=true

[Dbus]
lxde=true

[Environment]
menu_prefix=lxde-' | sudo tee $HOME/.config/lxsession/LXDE/desktop.conf

echo '[Settings]
gtk-theme-name=ZorinBlue-Dark
gtk-icon-theme-name=Uos-fulldistro-icons
gtk-font-name=Sans 10
gtk-cursor-theme-size=18
gtk-toolbar-style=GTK_TOOLBAR_BOTH_HORIZ
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=1
gtk-menu-images=1
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=1
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle=hintslight
gtk-xft-rgba=rgb' | sudo tee $HOME/.config/gtk-3.0/settings.ini

# Definir o papel de parede
sed -i 's|wallpaper=/etc/alternatives/desktop-background|wallpaper=/usr/share/backgrounds/john-towner-JgOeRuGD_Y4.jpg|' ~/.config/pcmanfm/LXDE/desktop-items-0.conf

vncserver -kill
rm -rf /tmp/.X$pt-lock
rm -rf /tmp/.X11-unix/X$pt
#rm -rf Uos-fulldistro-icons.tar.xz

bash pacotes.sh