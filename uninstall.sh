#!/data/data/com.termux/files/usr/bin/bash

echo "Calma! Estou desinstalando o sistema. Sóum instante..."

chmod 777 -R ubuntu22-fs
rm -rf ubuntu22-fs
rm -rf ubuntu22-binds
rm -rf ubuntu-install.sh
echo "Concluido"