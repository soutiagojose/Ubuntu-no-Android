<!--
📥 Downloads de apps
-->
# Como baixar alguns apps
Esta aba foi dedicada para aqueles mais leigos, que quer instalar um determinado programa mas nào sabe como instalar.

<!--
h1
|[** **]()|
h1 alt
|**↳** [** **]()|
h2
|  **↳** [** **]()|
h3
|    **↳** [** **]()|
-->

# Instale o Figma
> [!NOTE]
> O Figma não está oficialmente disponível para o Linux, mas existe uma comunidade chamada de [Figma Linux](https://github.com/Figma-Linux/figma-linux) que desenvolveu um sofware que permite usar o Figma no Linux com o suporte a opções que só a versào desktop do Figma oficial teria.

Copie e cole o código abaixo para fazer a instalação.
```shell
wget https://github.com/Figma-Linux/figma-linux/releases/download/v0.11.2/figma-linux_0.11.2_linux_arm64.deb
sudo apt install ./figma-linux_0.11.2_linux_arm64.deb -y
sed -i 's|Exec=/opt/figma-linux/figma-linux|Exec=/opt/figma-linux/figma-linux --no-sandbox|' /usr/share/applications/figma-linux.desktop
```
