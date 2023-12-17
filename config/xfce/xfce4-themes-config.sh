#!/bin/bash
extralink="https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config"
#
# Customização do painel xfce
wget $extralink/xfce/xfce4-panel.tar.bz2

vncserver -name remote-desktop -geometry 1920x1080 :1
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e ""
echo -e "


























"
xfconf-query -c xsettings -p /Net/ThemeName -s ZorinBlue-Dark

vncserver -kill
rm -rf /root/.vnc/localhost:5901.pid
rm -rf /tmp/.X$pt-lock
rm -rf /tmp/.X11-unix/X$pt

vncserver -name remote-desktop -geometry 1920x1080 :1
mkdir $HOME/.config/xfce4/
mkdir $HOME/.config/xfce4/xconf
mkdir $HOME/.config/xfce4/xconf/xfce-perchannel-xml

xfconf-query -c xsettings -p /Net/ThemeName -s ZorinBlue-Dark
xfconf-query -c xsettings -p /Net/IconThemeName -s Uos-fulldistro-icons
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVNC-0/workspace0/last-image -s /usr/share/backgrounds/john-towner-JgOeRuGD_Y4.jpg
xfce4-panel-profiles load xfce4-panel.tar.bz2

sed -i 's|property name="last-image" type="string" value="/usr/share/backgrounds/xfce/xfce-verticals.png"property name="last-image" type="string" value="/usr/share/backgrounds/john-towner-JgOeRuGD_Y4.jpg"|' $HOME/.config/xfce4/xconf/xfce-perchannel-xml/xfce4-desktop.xml
echo '<?xml version="1.0" encoding="UTF-8"?>

<channel name="xsettings" version="1.0">
  <property name="Net" type="empty">
    <property name="ThemeName" type="string" value="ZorinBlue-Dark"/>
    <property name="IconThemeName" type="string" value="Uos-fulldistro-icons"/>
    <property name="DoubleClickTime" type="empty"/>
    <property name="DoubleClickDistance" type="empty"/>
    <property name="DndDragThreshold" type="empty"/>
    <property name="CursorBlink" type="empty"/>
    <property name="CursorBlinkTime" type="empty"/>
    <property name="SoundThemeName" type="empty"/>
    <property name="EnableEventSounds" type="empty"/>
    <property name="EnableInputFeedbackSounds" type="empty"/>
  </property>
  <property name="Xft" type="empty">
    <property name="DPI" type="empty"/>
    <property name="Antialias" type="empty"/>
    <property name="Hinting" type="empty"/>
    <property name="HintStyle" type="empty"/>
    <property name="RGBA" type="empty"/>
  </property>
  <property name="Gtk" type="empty">
    <property name="CanChangeAccels" type="empty"/>
    <property name="ColorPalette" type="empty"/>
    <property name="FontName" type="empty"/>
    <property name="MonospaceFontName" type="empty"/>
    <property name="IconSizes" type="empty"/>
    <property name="KeyThemeName" type="empty"/>
    <property name="ToolbarStyle" type="empty"/>
    <property name="ToolbarIconSize" type="empty"/>
    <property name="MenuImages" type="empty"/>
    <property name="ButtonImages" type="empty"/>
    <property name="MenuBarAccel" type="empty"/>
    <property name="CursorThemeName" type="empty"/>
    <property name="CursorThemeSize" type="empty"/>
    <property name="DecorationLayout" type="empty"/>
    <property name="DialogsUseHeader" type="empty"/>
    <property name="TitlebarMiddleClick" type="empty"/>
  </property>
  <property name="Gdk" type="empty">
    <property name="WindowScalingFactor" type="empty"/>
  </property>
</channel>' | sudo tee  $HOME/.config/xfce4/xconf/xfce-perchannel-xml/xsettings.xml

echo -e "


























"

rm -rf xfce4-panel.tar.bz2
rm -rf Uos-fulldistro-icons.tar.xz

vncserver -kill
rm -rf /root/.vnc/localhost:5901.pid
rm -rf /tmp/.X$pt-lock
rm -rf /tmp/.X11-unix/X$pt

# Replicação para casos de erro

