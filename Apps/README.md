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
# Utilizado para extrair a tag da versão mais recente do Figma Linux da resposta JSON fornecida pela API do GitHub.
sudo apt-get install jq -y
# Obtém a última versão do Figma Linux usando a API do GitHub
latest_version=$(curl -s https://api.github.com/repos/Figma-Linux/figma-linux/releases/latest | jq -r '.tag_name')

# Remove o "v" apenas do segundo uso da variável latest_version
version_without_v=$(echo $latest_version | sed 's/^v//')

#echo "https://github.com/Figma-Linux/figma-linux/releases/download/$latest_version/figma-linux_${version_without_v}_linux_arm64.deb"

# Constrói o URL de download
download_url="https://github.com/Figma-Linux/figma-linux/releases/download/$latest_version/figma-linux_${version_without_v}_linux_arm64.deb"

# Baixa o pacote mais recente
wget $download_url

# Instala o pacote
sudo apt install "./figma-linux_${version_without_v}_linux_arm64.deb" -y

# Atualiza o arquivo .desktop para adicionar a opção --no-sandbox
sed -i "s|Exec=/opt/figma-linux/figma-linux|Exec=/opt/figma-linux/figma-linux --no-sandbox|" /usr/share/applications/figma-linux.desktop
```
