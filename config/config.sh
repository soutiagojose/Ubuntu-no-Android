#!/bin/bash

extralink="https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/main/config"

# Atualizar lista e pacotes
sudo apt-get update
sudo apt-get full-upgrade -y

# Instalar pacotes necessários
sudo apt-get install sudo -y
sudo apt-get install wget -y
sudo apt-get install nano -y
sudo apt-get install dialog -y
sudo apt-get install inetutils-tools -y
sudo apt-get install dbus-x11 -y
sudo apt-get install exo-utils --no-install-recommends -y
sudo apt get install tigervnc-standalone-server tigervnc-common tigervnc-tools --no-install-recommends -y

