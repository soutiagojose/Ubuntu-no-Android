#!/bin/bash

#Get the necessary components
sudo apt-get update

sudo apt install udisks2 -y
sudo apt install neofetch -y
echo "" > /var/lib/dpkg/info/udisks2.postinst
sudo dpkg --configure -a
sudo apt-mark hold udisks2
sudo apt-get install keyboard-configuration -y
sudo apt-get install tzdata -y
sudo apt-get install sudo wget gpg curl nano inetutils-tools dialog -y
sudo apt-get install xfce4 xfce4-goodies xfce4-terminal exo-utils tigervnc-standalone-server tigervnc-common tigervnc-tools dbus-x11 --no-install-recommends -y
sudo apt-get install apt-utils gdebi font-viewer apt-transport-https bleachbit tumbler -y
sudo apt-get clean

mkdir -p ~/.vnc
wget https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/main/config/xfce4/vncserver-start -P /usr/local/bin/
wget https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/main/config/xfce4/vncserver-stop -P /usr/local/bin/
chmod +x /usr/local/bin/vncserver-start
chmod +x /usr/local/bin/vncserver-stop

echo '#!/bin/bash
export PULSE_SERVER=127.0.0.1
LANG=ptBR.UTF-8
export LANG
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
echo $$ > /tmp/xsession.pid
dbus-launch --exit-with-session /usr/bin/startxfce4' > ~/.vnc/xstartup

chmod +x ~/.vnc/xstartup

echo " "

#echo "Running browser patch"
#wget https://raw.githubusercontent.com/AndronixApp/AndronixOrigin/master/Uninstall/ubchromiumfix.sh && chmod +x ubchromiumfix.sh
#./ubchromiumfix.sh && rm -rf ubchromiumfix.sh

# Pacotes instalados via snap não são executáveis no Ubuntu VNC do Andronix e por isso é recomendável a desinstalação desses pacotes que podem ser pré-carregados durante a instalação do Ubuntu no Termux
sudo apt autoremove --purge chromium* -y
sudo apt autoremove --purge firefox* -y 
sudo snap remove firefox


# Adicionar as PPAs de repositórios
# Caso não queira adicionar algum desses repositórios, apague a linha e o comentário (o texto que vem após o #) relacionado ao PPA do repositório 
## PPA do Inkscape
sudo add-apt-repository ppa:inkscape.dev/stable -y
## PPA do LibreOffice
sudo add-apt-repository ppa:libreoffice/ppa -y
## PPA do Tema do ZorinOS
sudo add-apt-repository ppa:zorinos/stable -y
## PPA do Firefox
sudo add-apt-repository ppa:mozillateam/ppa -y


# Esse comando dá a prioridade de uso para a PPA ao invés do instalador snad e faz com que seja possível baixar o Firefox mais recente
echo 'Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001' | sudo tee /etc/apt/preferences.d/mozilla-firefox

# Dá a possibilidade do Firefox atualizar quando houver uma atualização
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox

# PPA do VSCode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

# PPA do Brave Browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt-get update
sudo apt-get full-upgrade -y

sudo apt install firefox apt-transport-https code -y

# Alguns pacotes tem dificuldades ou não foram projetados para serem abertos em sandbox/virtualização
# Solução é adicionar o comando --no-sandbox na linha referente ao executável
# Para o VSCode
sed -i 's|Exec=/usr/share/code/code|Exec=/usr/share/code/code --no-sandbox|' /usr/share/applications/code*.desktop

# Baixando papel de parede
wget https://raw.githubusercontent.com/allytiago/start-setup-ubuntu-andronix/main/setup/wallpapers/unsplash/john-towner-JgOeRuGD_Y4.jpg
mv john-towner-JgOeRuGD_Y4.jpg /usr/share/backgrounds/

# Customização do painel xfce
wget https://github.com/allytiago/Ubuntu-no-Android/raw/main/config/xfce4/xfce4-panel.tar.bz2

echo "Agora você pode iniciar o vncserver executando vncserver-start"
echo " "
echo "Ele solicitará que você insira uma senha ao iniciá-lo pela primeira vez."
echo " "
echo "O servidor VNC será iniciado em 127.0.0.1:5901"
echo " "
echo "Você pode se conectar a este endereço com um visualizador VNC de sua preferência"
echo " "
echo "Conectar-se a este endereço abrirá uma janela com o Xfce4 Desktop Environment"
echo " "
echo " "
echo " "
echo "Executando vncserver-start"
echo " "
echo " "
echo " "
echo "Para finalizar o servidor VNC, execute vncserver-stop"
echo " "
echo " "
echo " "

echo "export DISPLAY=":1"" >> /etc/profile
source /etc/profile

vncpasswd
vncserver-start


# Troca o papel de parede
echo " "
echo " "
echo "Carregando perfil de painel"
xfce4-panel-profiles load xfce4-panel.tar.bz2
echo -e '\033[1;36mDefinindo o papel de parede\033[0m'
echo " "
echo -e '\033[1;97mPoderá trocar em Aplicativos > Configurações > Área de trabalho > Background\033[0m'
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVNC-0/workspace0/last-image -s  /usr/share/backgrounds/john-towner-JgOeRuGD_Y4.jpg
