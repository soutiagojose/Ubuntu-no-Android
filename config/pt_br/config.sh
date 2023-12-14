#!/bin/bash

# Atualizar repositório
sudo apt update
sudo apt-get update

# Mudar o idioma para o Portuguê Brasileiro [pt_BR]
sudo apt-get install locales language-pack-pt -y

mkdir -p ~/.vnc

if dpkg -l | grep -q lxde-core; then
    echo "#!/bin/bash
    [ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
    export PULSE_SERVER=127.0.0.1
    LANG=pt_BR.UTF-8
    export LANG
    [ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
    [ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
    echo $$ > /tmp/xsession.pid
    dbus-launch --exit-with-session startlxde" > ~/.vnc/xstartup
elif dpkg -l | grep -q xfce4; then
    echo "#!/bin/bash
    [ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
    export PULSE_SERVER=127.0.0.1
    LANG=pt_BR.UTF-8
    export LANG
    [ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
    [ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
    echo $$ > /tmp/xsession.pid
    dbus-launch --exit-with-session /usr/bin/startxfce4" > ~/.vnc/xstartup
else
    echo "null"
fi


chmod +x ~/.vnc/xstartup



## Gerar o idioma
sed -i 's/^# *\(pt_BR.UTF-8\)/\1/' /etc/locale.gen
locale-gen

## Exportar os comandos de configuração de idioma para ~/.bashrc
## Essa configuração necessita de reboot
echo 'export LC_ALL=pt_BR.UTF-8' >> ~/.bashrc
echo 'export LANG=pt_BR.UTF-8' >> ~/.bashrc
echo 'export LANGUAGE=pt_BR.UTF-8' >> ~/.bashrc
