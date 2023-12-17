#!/bin/bash

export USER=$(whoami)
HEIGHT=0
WIDTH=0
CHOICE_HEIGHT=5
BACKTITLE="Seleção de resolução"
TITLE="vncserver-start"
MENU="Escolha alguma das seguintes opções:"
export PORT=1


OPTIONS=(1 "Iniciar o vncserver na resolução Ultrawide HD"
         2 "Iniciar o vncserver na resolução Quad-HD"
         3 "Iniciar o vncserver na resolução Full-HD"
         4 "Iniciar o vncserver na resolução HD"
         5 "Iniciar o vncserver com resolução e porta customizada"
         6 "Iniciar o vncserver com resolução, porta e escala customizada")



CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            echo "Você escolheu a resolução UWHD resolution"
            GEO="-geometry 2560x1080" vnc
            xfconf-query -c xsettings -p /Gdk/WindowScalingFactor -s 1
            xfconf-query -c xsettings -p /Net/ThemeName -s ZorinBlue-Dark
xfconf-query -c xsettings -p /Net/IconThemeName -s Uos-fulldistro-icons
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVNC-0/workspace0/last-image -s /usr/share/backgrounds/john-towner-JgOeRuGD_Y4.jpg
xfce4-panel-profiles load xfce4-panel.tar.bz2
            ;;
        2)
            echo "Você escolheu a resolução QHD resolution"
            GEO="-geometry 2560x1440" vnc
            xfconf-query -c xsettings -p /Gdk/WindowScalingFactor -s 1
            xfconf-query -c xsettings -p /Net/ThemeName -s ZorinBlue-Dark
xfconf-query -c xsettings -p /Net/IconThemeName -s Uos-fulldistro-icons
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVNC-0/workspace0/last-image -s /usr/share/backgrounds/john-towner-JgOeRuGD_Y4.jpg
xfce4-panel-profiles load xfce4-panel.tar.bz2
            ;;
        3)
            echo "Você escolheu a resolução Full HD resolution"
            GEO="-geometry 1920x1080" vnc
            xfconf-query -c xsettings -p /Gdk/WindowScalingFactor -s 1
            xfconf-query -c xsettings -p /Net/ThemeName -s ZorinBlue-Dark
xfconf-query -c xsettings -p /Net/IconThemeName -s Uos-fulldistro-icons
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVNC-0/workspace0/last-image -s /usr/share/backgrounds/john-towner-JgOeRuGD_Y4.jpg
xfce4-panel-profiles load xfce4-panel.tar.bz2
            ;;
        4)
            echo "Você escolheu a resolução HD-ready resolution"
            GEO="-geometry 1280x720" vnc
            xfconf-query -c xsettings -p /Gdk/WindowScalingFactor -s 1
            xfconf-query -c xsettings -p /Net/ThemeName -s ZorinBlue-Dark
xfconf-query -c xsettings -p /Net/IconThemeName -s Uos-fulldistro-icons
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVNC-0/workspace0/last-image -s /usr/share/backgrounds/john-towner-JgOeRuGD_Y4.jpg
xfce4-panel-profiles load xfce4-panel.tar.bz2
            ;;
        5)
            echo "Você escolheu definir a resolução e porta manualmente"
            echo "Insira a resolução personalizada no formato WIDTHxHEIGHT (LARGURA x ALTURA). Exemplo: 1920x1200"
            read custom
            echo "Insira o número da porta. Exemplo: 2"
            read port
            GEO="-geometry $custom" PORT=$port vnc
            xfconf-query -c xsettings -p /Gdk/WindowScalingFactor -s 1
            xfconf-query -c xsettings -p /Net/ThemeName -s ZorinBlue-Dark
xfconf-query -c xsettings -p /Net/IconThemeName -s Uos-fulldistro-icons
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVNC-0/workspace0/last-image -s /usr/share/backgrounds/john-towner-JgOeRuGD_Y4.jpg
xfce4-panel-profiles load xfce4-panel.tar.bz2
            ;;
         6)
            echo "Você escolheu definir a resolução e porta manualmente"
            echo "Insira a resolução personalizada no formato WIDTHxHEIGHT (LARGURA x ALTURA). Exemplo: 1920x1200"
            read custom
            echo "Insira o número da porta. Exemplo: 2"
            read port
            echo "Insira o número da escala. Exemplo: 2"
            read scaling
            GEO="-geometry $custom" PORT=$port vnc
            xfconf-query -c xsettings -p /Gdk/WindowScalingFactor -s $scaling
            xfconf-query -c xsettings -p /Net/ThemeName -s ZorinBlue-Dark
xfconf-query -c xsettings -p /Net/IconThemeName -s Uos-fulldistro-icons
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVNC-0/workspace0/last-image -s /usr/share/backgrounds/john-towner-JgOeRuGD_Y4.jpg
xfce4-panel-profiles load xfce4-panel.tar.bz2
            ;;
esac

bash --login
