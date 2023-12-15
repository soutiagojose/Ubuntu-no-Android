#!/bin/bash

extralink="https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config"

#Get the necessary components
sudo apt-get update

sudo apt install udisks2 -y
echo "" > /var/lib/dpkg/info/udisks2.postinst
sudo dpkg --configure -a
sudo apt-mark hold udisks2
sudo apt install neofetch -y
sudo apt-get install keyboard-configuration -y
sudo apt-get install tzdata -y
sudo apt-get install sudo wget gpg curl -y
sudo apt-get install nano inetutils-tools dialog -y
sudo apt-get install exo-utils tigervnc-standalone-server tigervnc-common tigervnc-tools dbus-x11 --no-install-recommends -y
sudo apt-get install software-properties-common nautilus -y
sudo apt-get clean


# Pacotes instalados via snap não são executáveis no Ubuntu VNC do Andronix e por isso é recomendável a desinstalação desses pacotes que podem ser pré-carregados durante a instalação do Ubuntu no Termux
sudo apt autoremove --purge chromium* -y
sudo apt autoremove --purge firefox* -y
sudo snap remove firefox
sudo apt autoremove --purge snapd -y

sudo apt-get update
sudo apt-get full-upgrade -y


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

# Corrigindo problema de instalação do Chromium

sudo add-apt-repository ppa:chromium-team/beta -y
rm -rf /etc/apt/sources.list.d/chromium-team-ubuntu-beta-jammy.list

echo 'deb https://ppa.launchpadcontent.net/chromium-team/beta/ubuntu/ bionic main
# deb-src https://ppa.launchpadcontent.net/chromium-team/beta/ubuntu/ bionic  main' | sudo tee /etc/apt/sources.list.d/chromium-team-ubuntu-beta-bionic.list

echo 'Package: *
Pin: release o=LP-PPA-chromium-team-beta
Pin-Priority: 1001

Package: chromium*
Pin: origin "LP-PPA-chromium-team-beta"
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/chromium

echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-chromium-team-beta:bionic";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-chromium


# PPA do Brave Browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt-get update
sudo apt install zorin-desktop-themes -y
#sudo apt install firefox chromium-browser apt-transport-https code apt-utils gdebi font-viewer bleachbit tumbler -y

# Alguns pacotes tem dificuldades ou não foram projetados para serem abertos em sandbox/virtualização
# Solução é adicionar o comando --no-sandbox na linha referente ao executável
# Para o VSCode
#sed -i 's|Exec=/usr/share/code/code|Exec=/usr/share/code/code --no-sandbox|' /usr/share/applications/code*.desktop

# Para Chromium Web Browser
#sed -i 's|Exec=chromium-browser|Exec=chromium-browser --no-sandbox|' /usr/share/applications/chromium-browser.desktop

# Baixando papel de parede
if [ ! -d "/usr/share/backgrounds/" ];then
  mkdir -p "/usr/share/backgrounds/"
fi
#mkdir -p /usr/share/backgrounds/
wget $extralink/wallpapers/unsplash/john-towner-JgOeRuGD_Y4.jpg  -O /usr/share/backgrounds/john-towner-JgOeRuGD_Y4.jpg

# Instalação do pacote de icones
wget $extralink/icons/Uos-fulldistro-icons.tar.xz

if [ ! -d "/usr/share/icons/" ];then
  mkdir -p "/usr/share/icons/"
fi

tar -xf Uos-fulldistro-icons.tar.xz -C /usr/share/icons



echo "export DISPLAY=":1"" >> /etc/profile
source /etc/profile




## Seletor de idiomas
export USER=$(whoami)
HEIGHT=0
WIDTH=0
CHOICE_HEIGHT=5
TITLE="Select"
MENU="Escolha algumas das seguintes opções: \n \nChoose any of the following options: "
export PORT=1

OPTIONS=(1 "Português (brasileiro)")

CHOICE=$(dialog --clear \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
1)
wget $extralink/pt_br/config.sh -O locale-config.sh
wget $extralink/pt_br/locale.sh
;;
esac
