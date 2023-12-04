![Ubuntu no Android](https://repository-images.githubusercontent.com/713667201/071927be-df6a-4c8c-b291-65a1f1cd933d)
# Comece com Ubuntu no Android
O repositório Ubuntu no Android permite instalar o Ubuntu ARM64 em dispositivos Android sem root, com o uso do terminal Termux e uma VNC.

| **Comece selecionando alguma das opções abaixo.** |
|--------------------|
|[**Como funciona?**](#como-funciona)|
||
|[**Resolução de problemas**](#resolução-de-problemas)|
| **↳** [**Trocar o idioma do sistema**](#trocar-o-idioma-do-sistema)|
|  **↳** [**Passo 1 - atualize os repositórios**](#passo-1---atualize-os-repositórios)|
|  **↳** [**Passo 2 - instale o pacote `locales`**](#passo-2---instale-o-pacote-locales)|
|  **↳** [**Passo 3 - gere o idioma**](#passo-3---gere-o-idioma)|
|  **↳** [**Passo 4 - inicialize com o sistema**](#passo-4---inicialize-com-o-sistema)|
|  **↳** [**Passo 5 - trocar o idioma do PulseAudio**](#passo-5---trocar-o-idioma-do-pulseaudio)|
| **↳** [**Instalar o Firefox como .deb no Ubuntu 22.04 sem ser ser pelo Snap**](#instalar-o-firefox-como-deb-no-ubuntu-2204-sem-ser-pelo-snap)|
| **↳** [**Firefox crash**](#firefox-crash)|
| **↳** [**Problema de inicialização no Chromium Web Browser, Brave Browser, Vivaldi, Vscode e Figma-Linux**](#problema-de-inicialização-no-chromium-web-browser-brave-browser-vivaldi-vscode-e-figma-linux)|
|  **↳** [**Resolvendo a inicialização do Chromium Web Browser**](#resolvendo-a-inicialização-do-chromium-web-browser)|
|  **↳** [**Resolvendo a inicialização do Brave Browser**](#resolvendo-a-inicialização-do-brave-web-browser)|
|  **↳** [**Resolvendo a inicialização do Vivaldi**](#resolvendo-a-inicialização-do-vivaldi-web-browser)|
|  **↳** [**Resolvendo a inicialização do VSCode**](#resolvendo-a-inicialização-do-vscode)|
|  **↳** [**Resolvendo a inicialização do Figma Linux**](#resolvendo-a-inicialização-do-figma-linux)|
<!--
h1
|[** **]()|
h1 alt
|**↳** [** **]()|
h2
| **↳** [** **]()|
h3
|  **↳** [** **]()|
-->

# Como funciona?
O script de instalação deste repositório usa o [PRoot](https://wiki.termux.com/wiki/PRoot) para executar a distribuição Linux em seus dispositivos Android sem root.

<!--
## Script de instalação
Este script ainda está em fase de testes
```
pkg update -y && pkg install wget curl proot tar -y && wget https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/main/Installer/install.sh -O ubuntu-install.sh && chmod +x ubuntu-install.sh && bash ubuntu-install.sh
```
> Este script ainda está em sua versão beta. Não recomendo que seja utilizado para finalidades além de reportar erros e melhorias.
-->











# Resolução de problemas

## Trocar o idioma do sistema
Por padrão, o sistema será instalado no idioma Inglês dos Estados Unidos. Para trocar para o idioma de outra região, será necessário executar os seguintes comandos no terminal com o Ubuntu já iniciado.
>Para este script, foi utilizado o ICU Locale Portugués do Brasil, que é o `pt_BR` e o formato de codificação `UTF-8`

A solução ágil é executar o script abaixo para que o sistema seja completamente alterado do Inglês dos Estados Unidos para o Português do Brasil
```shell
sudo apt-get update
wget https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/main/config/pt_br/config.sh -O pt_BR-config.sh
chmod +x pt_BR-config.sh
bash ubuntu-install.sh
rm -rf pt_BR-config.sh
exit
```

Versão de linha única
```shell
sudo apt-get update && wget https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/main/config/pt_br/config.sh -O pt_BR-config.sh && chmod +x pt_BR-config.sh && bash ubuntu-install.sh && rm -rf pt_BR-config.sh && exit
```

### Passo 1 - atualize os repositórios
```shell
sudo apt-get update
```

### Passo 2 - instale o pacote `locales`
```shell
sudo apt install locales -y
```

### Passo 3 - gere o idioma
```shell
sed -i 's/^# *\(pt_BR.UTF-8\)/\1/' /etc/locale.gen
locale-gen
```
> Troque o `pt_BR` pelo ICU Locale da sua região e o `UTF-*` pelo formato de codificação da sua região.

### Passo 4 - inicialize com o sistema
Esse script fará com que a distribuição Ubuntu sempre seja iniciada no idioma escolhido
```shell
echo 'export LC_ALL=pt_BR.UTF-8' >> ~/.bashrc
echo 'export LANG=pt_BR.UTF-8' >> ~/.bashrc
echo 'export LANGUAGE=pt_BR.UTF-8' >> ~/.bashrc
```
> Troque o `pt_BR` pelo ICU Locale da sua região.
> 
> Após executar os comandos, saia da distribuição Ubuntu.
>
> Use o comando `exit` para sair do `root@localhost`.
>
> Caso o servidor vnc esteja ativo, desative-o.

### Passo 5 - trocar o idioma do PulseAudio
```shell
echo '#!/bin/bash
export PULSE_SERVER=127.0.0.1
LANG=pt_BR.UTF-8
export LANG
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
echo $$ > /tmp/xsession.pid
dbus-launch --exit-with-session /usr/bin/startxfce4' > ~/.vnc/xstartup
```
> Troque o `pt_BR` pelo ICU Locale da sua região





## Instalar o Firefox como .deb no Ubuntu 22.04 sem ser pelo Snap
> Se usou o meu instalador, não será necessário fazer essa resolução de problema. O script do passo 3 da instalação do ubuntu já resolve este problema

Nesta versão do Ubuntu, o `apt install firefox` não instala o pacote deb, mas sim, o pacote snap, que não funciona nessa versão do Ubuntu por limitações do Android. Para resolver esse problema e poder instalar e atualizar o Firefox, siga o passo a passo:

### Passo 1 - Remova o Firefox
Pode ser que haja algum resíduo ou pode ser que haja uma versão do Firefox e deve ser removida antes de iniciar todo esse processo.
```shell
sudo snap remove firefox
```
```shell
sudo apt autoremove --purge firefox* -y
```
> Use qualquer um dos dois comandos para desinstalar o o pacote do Firefox
> Eu particularmente uso a do `apt`, mas pode usar os dois por garantia.

### Passo 2 - Adicionando o repositório da Mozilla
Este é o PPA da Mozilla que deve ser adicionado a lista de fontes de softwares para que seu terminal possa instalar o pacote deb
```shell
 sudo add-apt-repository ppa:mozillateam/ppa -y
```
```shell
sudo apt update
```
> Use esse comando para atualizar esse repositório

### Passo 3 - Priorizar o PPA/apt/deb no lugar do snap
Mesmo com o repositório instalado, pode ser que o terminal opte em instalar pelo snap. Para evitar isso, copie o seguinte código, cole no teminal e tecle `enter`
```shell
echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox
```

### Passo 4 - Permita atualizações automáticas
O seguinte passo permite que o firefox faça atualizações automáticas quando instalado
```shell
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
```

### Instalando o Firefox
Agora, com tudo pronto, pode usar o `apt update` para atualizar os repositórios por garantia, ou já seguir direto para a instalação. O comando a seguir instala o Firefox
```shell
sudo apt install firefox -y
```

## Firefox crash
Caso o firefox mostre o alerta de erro e não consiga acessar nenhuma página. Será necessário alterar o nível de de segurança do sandbox para 0. Para isso, siga os seguintes passos:
1. Abra o Firefox
2. Digite no campo de pesquisa: `about: config` e dê `enter`
3. Vai aparecer um alerta. Coinfirme clicando em `Aceitar o risco e continuar` ou em `Accept the Risk and Continue`
4. Agora no campo de pesquisa: `Pesquisar preferências por nome` ou `Search preference name`, pesquise por `security.sandbox.content.level`
5. O resultado padrão será 4. Clique no lápis ✏️ ou dê duplo clique no valor e troque `4` por `0` e após tecle `enter` ou clique no check ☑️.
6. Reinicie o Firefox (Feche o navegador e abra novamente)





## Problema de inicialização no Chromium Web Browser, Brave Browser, Vivaldi, Vscode e Figma-Linux
Esses programas listados possuem um problema de inicialização dentro do VNC e isso é devido a uma restrição ao `sandbox`. Para resolver esse problema, é necessário a adição de uma `option` ao comando de execução de cada um deles. Listarei o comando a ser colado no terminal para resolver o problema:
> Para solucionar este problema, utilizo o comando `sed` para procurar pela linha com o executável e substituir por outro comando de execução
### Resolvendo a inicialização do Chromium Web Browser
```shell
sed -i 's|Exec=chromium-browser|Exec=chromium-browser --no-sandbox|' /usr/share/applications/chromium-browser.desktop
```
### Resolvendo a inicialização do Brave Web Browser
```shell
sed -i 's|Exec=/usr/bin/brave-browser-stable|Exec=/usr/bin/brave-browser-stable --no-sandbox|' /usr/share/applications/brave-browser.desktop
```
### Resolvendo a inicialização do Vivaldi Web Browser
```shell
sed -i 's|Exec=/usr/bin/vivaldi-stable|Exec=/usr/bin/vivaldi-stable --no-sandbox|' /usr/share/applications/vivaldi-stable.desktop
```
### Resolvendo a inicialização do VSCode
```shell
sed -i 's|Exec=/usr/share/code/code|Exec=/usr/share/code/code --no-sandbox|' /usr/share/applications/code*.desktop
```
### Resolvendo a inicialização do Figma Linux
```shell
sed -i 's|Exec=/opt/figma-linux/figma-linux|Exec=/opt/figma-linux/figma-linux --no-sandbox|' /usr/share/applications/figma-linux.desktop
```

