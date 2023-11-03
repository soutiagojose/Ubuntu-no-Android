#!/bin/bash
#Instalador do Chromuium via deb file para Ubuntu 22.04
# Versão 106.0.5249.30-2ubuntu0.18.04_arm64
# Fonte: https://launchpad.net/~chromium-team/+archive/ubuntu/beta/+packages

echo -e '\033[1;36mBaixando os pacotes necessários para a instalação\033[0m'
echo -e '\033[1;36mChromium Web Browser Versão 106.0.5249.30-2ubuntu0.18.04_arm64\033[0m'
# Evitando que o sistema tente atualizar automaticamente para o instalador snap
sudo apt-mark hold chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg-extra chromium-chromedriver

# Baixar os pacotes
wget https://launchpad.net/~chromium-team/+archive/ubuntu/beta/+build/24358541/+files/chromium-codecs-ffmpeg-extra_106.0.5249.30-2ubuntu0.18.04_arm64.deb
wget https://launchpad.net/~chromium-team/+archive/ubuntu/beta/+build/24358541/+files/chromium-browser_106.0.5249.30-2ubuntu0.18.04_arm64.deb
wget https://launchpad.net/~chromium-team/+archive/ubuntu/beta/+files/chromium-browser-l10n_106.0.5249.30-2ubuntu0.18.04_all.deb
wget https://launchpad.net/~chromium-team/+archive/ubuntu/beta/+build/24358541/+files/chromium-chromedriver_106.0.5249.30-2ubuntu0.18.04_arm64.deb
echo -e '\033[1;36mPacotes baixados\033[0m'
echo -e '\033[1;36mRealizando a instalação dos pacotes\033[0m'
# Instalando os codecs de mídia
sudo apt install ./chromium-codecs-ffmpeg-extra_106.0.5249.30-2ubuntu0.18.04_arm64.deb -y
rm -rf chromium-codecs-ffmpeg-extra_106.0.5249.30-2ubuntu0.18.04_arm64.deb
# Instalando o navegador
sudo apt install ./chromium-browser_106.0.5249.30-2ubuntu0.18.04_arm64.deb -y
rm -rf chromium-browser_106.0.5249.30-2ubuntu0.18.04_arm64.deb
# Instalando o pacote de idiomas
sudo apt install ./chromium-browser-l10n_106.0.5249.30-2ubuntu0.18.04_all.deb -y
rm -rf chromium-browser-l10n_106.0.5249.30-2ubuntu0.18.04_all.deb
# Instalando o webdriver
sudo apt install ./chromium-chromedriver_106.0.5249.30-2ubuntu0.18.04_arm64.deb -y
rm -rf chromium-chromedriver_106.0.5249.30-2ubuntu0.18.04_arm64.deb
echo -e '\033[1;36mPacotes instalados\033[0m'
echo -e '\033[1;36mCorrigindo problema de inicialização\033[0m'
# Corrigindo o erro do sandbox
sed -i 's|Exec=chromium-browser|Exec=/usr/bin/chromium-browser --no-sandbox|' /usr/share/applications/chromium-browser.desktop
echo -e '\033[1;36mInstalação completa\033[0m'
