#!/bin/bash
extralink="https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/config"

# Atualizar lista e pacotes
sudo apt-get update
sudo apt-get full-upgrade -y

# Instalar pacotes necessários
sudo apt-get install sudo wget nano dialog inetutils-tools dbus-x11 -y
sudo apt-get install keyboard-configuration -y
clear
sudo apt-get install tzdata -y #dpkg-reconfigure tzdata
clear
sudo apt-get install exo-utils --no-install-recommends -y
sudo apt-get install tigervnc-standalone-server tigervnc-common tigervnc-tools --no-install-recommends -y
#sudo apt install udisks2 -y
#echo "" > /var/lib/dpkg/info/udisks2.postinst
#sudo dpkg --configure -a
#sudo apt-mark hold udisks2

sudo apt-get install software-properties-common -y # o problema pode estar aqui

# PPAs de repositórios
## PPA do Chromium
sudo add-apt-repository ppa:chromium-team/beta -y
### Será necessário remover a lista atual para usar uma lista referente a uma versão antiga, a Bionic
rm -rf /etc/apt/sources.list.d/chromium-team-ubuntu-beta-jammy.list
### Adicionar a nova lista
echo 'deb https://ppa.launchpadcontent.net/chromium-team/beta/ubuntu/ bionic main
# deb-src https://ppa.launchpadcontent.net/chromium-team/beta/ubuntu/ bionic  main' | sudo tee /etc/apt/sources.list.d/chromium-team-ubuntu-beta-bionic.list
### Esse comando dá a prioridade de uso para a PPA ao invés do instalador snad e faz com que seja possível baixar a versão mais recente
echo 'Package: *
Pin: release o=LP-PPA-chromium-team-beta
Pin-Priority: 1001

Package: chromium*
Pin: origin "LP-PPA-chromium-team-beta"
Pin-Priority: 1001' | sudo tee /etc/apt/preferences.d/chromium
# Atualizar a lista de repositórios para adicionar as novas listas

## PPA do Firefox
sudo add-apt-repository ppa:mozillateam/ppa -y
### Esse comando dá a prioridade de uso para a PPA ao invés do instalador snad e faz com que seja possível baixar o Firefox mais recente
echo 'Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001' | sudo tee /etc/apt/preferences.d/mozilla-firefox

### Dá a possibilidade do Firefox atualizar quando houver uma atualização
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox


## PPA do Inkscape
sudo add-apt-repository ppa:inkscape.dev/stable -y

## PPA do LibreOffice
sudo add-apt-repository ppa:libreoffice/ppa -y

## PPA do Tema do ZorinOS
sudo add-apt-repository ppa:zorinos/stable -y

## PPA do VSCode
sudo apt-get install gpg -y
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

## PPA do Brave Browser
sudo apt-get install curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

# Instalar os pacotes
sudo apt install zorin-desktop-themes -y
sudo apt install apt-transport-https -y
sudo apt update
sudo apt install code -y
sudo apt install chromium-browser -y

# Permitir a inicialização
# Para o VSCode
sed -i 's|Exec=/usr/share/code/code|Exec=/usr/share/code/code --no-sandbox|' /usr/share/applications/code*.desktop

# Para Chromium Web Browser
sed -i 's|Exec=chromium-browser|Exec=chromium-browser --no-sandbox|' /usr/share/applications/chromium-browser.desktop

sudo apt-get install nautilus gdebi font-viewer tumbler bleachbit gedit -y


# Baixando papel de parede
if [ ! -d "/usr/share/backgrounds/" ];then
  mkdir -p "/usr/share/backgrounds/"
fi

wget --tries=20 "$extralink/wallpapers/unsplash/john-towner-JgOeRuGD_Y4.jpg" -P /usr/share/backgrounds

# Baixando pacote de icones
if [ ! -d "/usr/share/icons" ];then
  mkdir -p "/usr/share/icons"
fi

wget --tries=20 "$extralink/icons/Uos-fulldistro-icons.tar.xz" -P /usr/share/icons

tar -xf Uos-fulldistro-icons.tar.xz -C /usr/share/icons


rm -rf config.sh
rm -rf language-base.sh