echo "Você escolheu o idioma Português Brasileiro"
wget --tries=20 $extralink/pt_br/config.sh -O $folder/root/lang-config.sh
wget --tries=20 $extralink/pt_br/tigervnc/vnc -P /usr/local/bin > /dev/null
wget --tries=20 $extralink/pt_br/tigervnc/vncpasswd -P /usr/local/bin > /dev/null
wget --tries=20 $extralink/pt_br/tigervnc/stopvnc -P /usr/local/bin > /dev/null
if dpkg -l | grep -q lxde-core; then
wget --tries=20  $extralink/pt_br/tigervnc/lxde/startvnc -P /usr/local/bin > /dev/null
elif dpkg -l | grep -q xfce4; then
wget --tries=20  $extralink/pt_br/tigervnc/xfce/startvnc -P /usr/local/bin > /dev/null
else
echo 'Não identifiquei a interface'
fi
clear
