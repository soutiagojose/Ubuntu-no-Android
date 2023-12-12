#!/data/data/com.termux/files/usr/bin/bash

echo "Estou desinstalando o sistema. Só um instante..."

chmod 777 -R ubuntu22-fs
rm -rf ubuntu22-fs
rm -rf ubuntu22-binds
rm -rf ubuntu-install.sh
rm -rf start-ubuntu.sh
rm -rf ubuntu-uninstall.sh
echo "Concluido"
