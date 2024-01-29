<!--
📄  Documentação
-->
![Ubuntu no Android](https://repository-images.githubusercontent.com/713667201/071927be-df6a-4c8c-b291-65a1f1cd933d)
# Comece com Ubuntu no Android
O repositório Ubuntu no Android permite instalar o Ubuntu ARM64 em dispositivos Android sem root, com o uso do terminal Termux e uma VNC.
> [!NOTE]
> Esse script de instalação foi feito para dispositivos Android com a arquitetura ARM64

> [!IMPORTANT]
> Todo o sistema será execultado dentro do Termux e por não haver root, não irá modificar as configurações do Android. <br>
> A imagem de instalação do sistema é direta dos servidores do Ubuntu para garatir a autenticidade.<br>
> O código desse instalador está totalmente aberto para que possa conferir cada arquivo.<br>

>[!WARNING]
> Caso instale algum arquivo desconhecido e que contenha malware, não é garantido que não afete a memória interna do aparelho visto que mesmo que o malware execulte somente dentro da maquina virtual, existe a possibilidade do Ubuntu ler e modificar os arquivos da memória interna. Só nã há a possibilidade de modificar arquivos protegidos de sistema como exemplo os da pasta `Android/data`.

<br>
<br>

| **Comece selecionando alguma das opções abaixo.** |
|--------------------|
|[**Como funciona?**](#como-funciona)|
||
|[**Qual a função desse script?**](#qual-a-função-desse-script)|
||
|[**Requisitos mínimos**](#requisitos-mínimos)|
||
|[**Instalações necessárias**](#instalações-necessárias)|
||
|[**Fazendo a instalação**](#fazendo-a-instalação)|
|  **↳** [**Passo 1 - instalando o Ubuntu**](#passo-1---instalando-o-ubuntu)|
|  **↳** [**Passo 2 - iniciando a interface gráfica**](#passo-2---iniciando-a-interface-gráfica)|
|  **↳** [**Passo 3 - finalizando o sistema**](#passo-3---finalizando-o-sistema)|
||
|[**Iniciando o sistema Ubuntu**](#iniciando-o-sistema-ubuntu)|
||
|[**Fazendo a desinstalação**](#fazendo-a-desinstalação)|
||
|[**Resolução de problemas**](#resolução-de-problemas)|
|  **↳** [**Problemas no Termux**](#problemas-no-termux)|
||
|  **↳** [**Trocar o idioma do sistema**](#trocar-o-idioma-do-sistema)|
|    **↳** [**Passo 1 - atualize os repositórios**](#passo-1---atualize-os-repositórios)|
|    **↳** [**Passo 2 - instale o pacote `locales`**](#passo-2---instale-o-pacote-locales)|
|    **↳** [**Passo 3 - instale os pacotes de idioma**](#passo-3---instale-os-pacotes-de-idioma)|
|    **↳** [**Passo 4 - gere o idioma**](#passo-3---gere-o-idioma)|
|    **↳** [**Passo 5 - inicialize com o sistema**](#passo-4---inicialize-com-o-sistema)|
||
|  **↳** [**Instalar o Firefox como .deb no Ubuntu 22.04 sem ser ser pelo Snap**](#instalar-o-firefox-como-deb-no-ubuntu-2204-sem-ser-pelo-snap)|
|    **↳** [**Passo 1 - remova o Firefox**](#passo-1---remova-o-firefox)|
|    **↳** [**Passo 2 - adicionando o repositório da Mozilla**](#passo-2---adicionando-o-repositório-da-mozilla)|
|    **↳** [**Passo 3 - priorizar o PPA/apt/deb no lugar do snap**](#passo-3---priorizar-o-ppaaptdeb-no-lugar-do-snap-para-o-firefox)|
|    **↳** [**Passo 4 - permita atualizações automáticas**](#passo-4---permita-atualizações-automáticas)|
|    **↳** [**Passo 5 - instalando o Firefox**](#passo-5---instalando-o-firefox)|
||
|  **↳** [**Firefox crash**](#firefox-crash)|
||
|  **↳** [**Instalar o Chromium Web Browser como .deb no Ubuntu 22.04 sem ser ser pelo Snap**](#instalar-o-chromium-web-browser-como-deb-no-ubuntu-2204-sem-ser-pelo-snap)|
|    **↳** [**Passo 1 - remova o Chromium**](#passo-1---remova-o-chromium)|
|    **↳** [**Passo 2 - adicionando o repositório da Chromium Team**](#passo-2---adicionando-o-repositório-da-chromium-team)|
|    **↳** [**Passo 3 - priorizar o PPA/apt/deb no lugar do snap para o Chromium**](#passo-3---priorizar-o-ppaaptdeb-no-lugar-do-snap-para-o-chromium)|
|    **↳** [**Passo 4 - remover a lista de pacotes padrão**](#passo-4---remover-a-lista-de-pacotes-padrão)|
|    **↳** [**Passo 5 - atualizar a lista de pacotes para instalar**](#passo-5---atualizar-a-lista-de-pacotes-para-instalar)|
|    **↳** [**Passo 6 - permita atualizações automáticas**](#passo-6---permita-atualizações-automáticas)|
|    **↳** [**Passo 7 - instalando o Chromium**](#passo-7---instalando-o-chromium)|
|    **↳** [**Passo 8 - corrigir a inicialização do Chromium**](#passo-8---corrigir-a-inicialização-do-chromium)|
||
|  **↳** [**Problema de inicialização no Chromium Web Browser, Brave Browser, Vivaldi, Vscode e Figma-Linux**](#problema-de-inicialização-no-chromium-web-browser-brave-browser-vivaldi-vscode-e-figma-linux)|
|    **↳** [**Resolvendo a inicialização do Chromium Web Browser**](#resolvendo-a-inicialização-do-chromium-web-browser)|
|    **↳** [**Resolvendo a inicialização do Brave Browser**](#resolvendo-a-inicialização-do-brave-web-browser)|
|    **↳** [**Resolvendo a inicialização do Vivaldi**](#resolvendo-a-inicialização-do-vivaldi-web-browser)|
|    **↳** [**Resolvendo a inicialização do VSCode**](#resolvendo-a-inicialização-do-vscode)|
|    **↳** [**Resolvendo a inicialização do Figma Linux**](#resolvendo-a-inicialização-do-figma-linux)|
||
|[**Lista de aparelhos usados nos testes**](#lista-de-aparelhos-usados-nos-testes)|
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
---

<br>
<br>

# Como funciona?
O script de instalação deste repositório usa o [PRoot](https://wiki.termux.com/wiki/PRoot) para executar a distribuição Linux em seus dispositivos Android sem root.

<br>
<br>

# Qual a função desse script?
- Instalar o Ubuntu em dispositivos Android;
- Adicionar repositórios que não estão presentes nos repositórios do Ubuntu;
- Atualizar o repositório do Firefox para que possa ser instalado a partir de um PPA ao invés do instalador snap (padrão) que não funciona no android;
- Instalar o Figma para linux com suporte ao arm;
- Corrigir o problema de iniciação do vscode, figma linux, brave-browser e vivaldi, que não são auto-abertos em máquina virtual sem o comando `--no-sandbox`;
- Trocar o idioma do sistema operacional para o Português do Brasil.


<br>
<br>

# Requisitos mínimos
Para o bom funcionamento do sistema, será necessário que atenda às especificações abaixo. Também é possível conferir quais dispositvos funcionam e quais não nessa lista: [aparelhos usados nos testes](#lista-de-aparelhos-usados-nos-testes)

|  Área | Requisito | Recomendável |Aceito, mas não recomendado |
| ------------- | --- | ------------- | ---- |
|Sistema operacional| Android 10 ou superior|
| RAM  | 6GB  | 8GB ou mais | 4GB|
|Memória interna do aparelho| 128GB¹ | 256GB ou mais|
|Espaço livre| 40GB de espaço livre na memmória interna|
|Apps| Termux, aplicativo de VNC da sua escolha|
|Adicional|Devido restrições do Android, a depender da versão disponível no seu aparelho será necessário desativar o Phantom Process|

>[!NOTE]
>¹ O sistema não inicia em aparelhos que possuem a memória interna de 64GB ou 32GB

> [!CAUTION]
> Usar o sistema em um dispositivo com processamento mais fraco pode causar sobrecarga e danificar componentes internos devido a alta demanta de processamento.
<br>
<br>


# Instalações necessárias
Para que tudo funcione corretamente, é necessário a instalação do **Termux**, do **Andronix** e do **AVNC**. O Termux irá instalar e executar a distribuição localmente, o Andronix disponibilizará o script de instalação da distribuição e o AVNC irá visualizar e possibilitar o uso da interface gráfica do Ubuntu.
|**Onde baixar**|
|------|
||
|**Termux**|
|<a href="https://github.com/termux/termux-app/releases" target="_blank"><img width="256px" src="/badges/get-it-on-github.png" alt="Baixe pelo GitHub"></a> <a href="https://f-droid.org/pt_BR/packages/com.termux/" target="_blank"><img width="256px" src="/badges/get-it-on-fdroid.png" alt="Baixe pelo F-Droid"></a>|
|**AVNC**|
|<a href="https://github.com/gujjwal00/avnc/releases" target="_blank"><img width="256px" src="/badges/get-it-on-github.png" alt="Baixe pelo GitHub"></a> <a href="https://f-droid.org/pt_BR/packages/com.gaurav.avnc/" target="_blank"><img width="256px" src="/badges/get-it-on-fdroid.png" alt="Baixe pelo F-Droid"></a> <a href="https://play.google.com/store/apps/details?id=com.gaurav.avnc" target="_blank"><img width="256px" src="/badges/get-it-on-google-play.png" alt="Baixe pelo Google Play Store"></a>|
> [!WARNING]
> O Termux da Google Play Store está desatualizado e não há mais suporte oficial.


<br>
<br>

# Fazendo a instalação

<br>

## Passo 1 - instalando o Ubuntu
1. Escolha entre uma das versões abaixo, copie e depois cole o código no termux usando o atalho `ctrl + alt + v` caso esteja usando um teclado ou clique e pessione na área da tela próxima do cifrão (`$`), clique em `paste` para colar e após isso, tecle `enter`.
 > [!IMPORTANT]
 > Caso ache algum problema, relate na opção "[Issues](https://github.com/allytiago/Ubuntu-no-Android/issues)".

>[!NOTE]
> A versão `estável` é a finalizada, com menos problemas de instalação.
>A versão `beta` é a de testes. Antes da versão `estável` ser atualizada, a versão `beta` que será usada para testar, encontrar problemas e trazer melhorias. Esta é uma versão com muito mais problemas.

**Estável**
```shell
pkg update -y && pkg install wget curl proot tar -y && wget https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/main/install.sh -O ubuntu-install.sh && chmod +x ubuntu-install.sh && bash ubuntu-install.sh
```

**Beta**
> [!IMPORTANT]
> Só escolha esta versão se a intenção for a de contribuir com melhorias ou adições de novas funções.
```shell
pkg update -y && pkg install wget curl proot tar -y && wget https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/beta/install.sh -O ubuntu-install.sh && chmod +x ubuntu-install.sh && bash ubuntu-install.sh
```

> [!NOTE]
> O código do [passo 1](#passo-1---instalando-o-ubuntu) fará uma atualização dos repositórios e de configurações do Termux. Só confirme teclando `enter`.
> Exemplo: quando aparecer a pergunta: `*** openssl.conf (Y/I/N/O/D/Z) [default=n] ?` o usuário poderá teclar `y` ou `n` e depois `enter` ou somente teclar `enter` e prosseguir. O ato de somente dar o `enter` já define a configuração padrão. O mesmo será feito quando as perguntas: `*** motod (Y/I/N/O/D/Z) [default=n] ?`, `*** sources.list (Y/I/N/O/D/Z) [default=n] ?`, `*** bash.bashrc (Y/I/N/O/D/Z) [default=n] ?` e`*** openssl.conf (Y/I/N/O/D/Z) [default=n] ?` aparecerem.

> [!CAUTION]
> Caso o Termux ainda não tenha permissão para ler o armazenamento, o app fará a solicitação que deverá confirmada para evitar possíveis problemas durante a instalação.

2. Escolha o idioma que será o padrão do sistema e depois clique em `<OK>`.
 
3. O próximo passo é definir o padrão de idioma do seu teclado. Aparecerá diversos idiomas com uma numeração ao lado e deverá usar essa numeração para especificar o idioma do seu teclado no campo de inserção: `Country of origin for the keyboard`.

> [!IMPORTANT]
> Se o teclado é padrão inglês, então será a opção `32. English (US)`, ou seja, terá que digitar `32` que é o número representativo do idioma e teclar `enter`. No caso do teclado inglês, deverá escolher a opção `14. English (US) - English (US, alt. int.)` caso utilize o idioma Português como padrão, mas o teclado tem outra formatação.
>
> Caso apareca o texto `[more]`, significa que a lista é maior que sua tela e será necessário teclar `enter` até aparecer a opção `Keyboard layout`.

> [!TIP]
> Você poderá trocar o idioma do teclado nas confirguarações do sistema.

4. Após a configuração do teclado, será perguntado a região/continente. Escolha o item que representa a sua região e digite o número no campo `Geographic area` e logo após, tecle `enter`.
   
> [!NOTE]
> Exemplo: caso esteja no continente americano, deverá procurar o item `2. America` e digitar o número `2` no campo `Geographic area`.

5. Depois de definir a região, será definido o fuso horário. Procure pelo item do fuso horário da sua região e digite o número que representa o item no campo `Time zone`. 
> [!NOTE]
> Exemplo: o item `22. Bahia` representa o fuso horário da Bahia, Estado brasileiro. Nesse caso, seria digitado o número `22` no campo `Time zone`.
 
6. Antes de finalizar o processo de instalação será solicitado a criação de senha para poder fazer login no servidor VNC. No campo `Digite a nova senha para o servidor VNC`, faça o que a pergunta auto explica: crie uma senha para poder fazer login no servidor.
> [!CAUTION]
>  O terminal não insere um `*` ou algum outro simbolo representativo de que foi inserido algum caractere dentro do campo de criação de senha. Portanto, tome cuidado ao digitar.

<br>

## Passo 2 - iniciando a interface gráfica
Agora que o Ubuntu foi instalado dentro do Termux o próximo passo será iniciar a visualização da interface gráfica do Ubuntu.
> [!TIP]
> Nesta documentação foi escolhido o AVNC como aplicativo para executar a visualização da interface gráfica.

1. Abra o seu app o AVNC;
2. Clique na bolinha com `+`;
3. Em `Nome (ex. PC do trabalho)`, dê um nome para identificar facilmente o sistema;
4. Em `Host`, digite `localhost`;
5. Na `Porta`, o AVNC define por padrão o valor `5900`, mude para `1` que é a porta padrão usada no servidor vnc;
> [!NOTE]
> Caso seja outra porta, digite o número da porta usado

6. Em `Qualidade de imagem`, marque a opção `Imagem não processada`;
7. Em `Segurança`, escolha troque a opção `Automático` por `VncAuth`;
8. Em `Nome de usuário`, pode deixar vazio;
9. Em `Senha`, você digita a senha criada no item 6 do [passo 1](#passo-1---instalando-o-ubuntu);
10. Depois clique em salvar;
11. Agora clique no card com o nome que você definiu.
> [!IMPORTANT]
> Caso apareça o erro `Disconnected`, verifique se o servidor vnc. foi iniciado.<br>
> Se o servidor vnc for iniciado, aparecerá a seguinte mensagem no termux: `Servidor VNC foi iniciado. A senha padrão é a senha da conta para root`.<br>
> Caso persista o erro de inicialização e a porta e host estão corretos, tente recriar a senha do VNC usando o comando `vncpasswd`.

<br>

## Passo 3 - finalizando o sistema
Para finalizar o sistema, ou seja, desligar o Ubuntu, deverá digitar o comando `stopvnc` pelo terminal Termux ou pelo terminal do Ubunut e em seguinda digitar o número da porta do servidor, que por padrão é `1`. Quando o Ubuntu for desligado, o AVNC não irá exibir mais a interface do sistema até que inicie o Ubuntu novamente.

<br>
<br>

# Iniciando o sistema Ubuntu
Toda vez que precisar iniciar o sistema, será necessário:
1. Abrir o app Termux;
2. Digitar o comando a abaixo e dar `enter` (confirmar):
   ```shell
   ./start-ubuntu.sh
   ```
3. Escolher a resolução desejada
4. Abrir o AVNC
5. Escolher o card com o nome escolhido no [passo: "iniciando a interface gráfica"](#passo-2---iniciando a-interface-gráfica);
6. Pronto! O sistema foi inicializado.
 > [!NOTE]
 > Caso queira encerrar o sistema, utilize o comando `stopvnc` (explicado no [passo: "finalizando o sistema"](#passo-3---finalizando-o-sistema)).

<br>
<br>

# Fazendo a desinstalação

<br>

Caso deseje desinstalar o sistema, copie e cole o comando abaixo no Termux:
```shell
wget https://raw.githubusercontent.com/allytiago/Ubuntu-no-Android/main/uninstall.sh -O ubuntu-uninstall.sh && chmod +x ubuntu-uninstall.sh && bash ubuntu-uninstall.sh
```
> [!IMPORTANT]
> Lembre-se de ter finalizado o `./start-ubuntu.sh`. Para saber se a distribuição Ubuntu está iniciada, procure pelo seguinte texto: `root@localhost` e caso esteja presente no terminal, a distribuição foi iniciada. Caso seja somente `~ $`, então está fora da distribuição e poderá usar o comando de desinstalação.<br>
> Caso esteja com a distribuição Ubuntu iniciada, finalize-a com o comando `exit` até trocar o `root@localhost` por `~ $`.

<br>
<br>

# Resolução de problemas

<br>

## Problemas no Termux
Como informado nas "[instalações necessárias](#instalações-necessárias)", o Termux disponível na Play Store foi descontinuado e sem suporte, por isso, o app quando baixado pela loja não estará funcional, sem poder se conectar com os servidores do terminal. Usar o F-Droid ou o instalável disponível nos [releases do termux](https://github.com/termux/termux-app/releases) para atualizar o app não resolverá o problema do terminal devido o tempo de diferença entre a atualização recente e a ultima atualização do Termux da Google Play Store.
Para resolver o problema, deverá desinstalar o Termux e reinstalar usando alguma das opções listadas nas "[instalações necessárias](#instalações-necessárias)".
> [!NOTE]
> O F-Droid baixa a versão do Termux mais compatível com o seu dispositivo. Já o das releases do Termux no GitHub não faz essa seleção e terá que baixar a correta para o seu dispositivo para que funcione corretamente.

<br>

## Trocar o idioma do sistema
>[!NOTE]
> O instalador já corrige essa questão. Só será necessário usar caso esteja usando um instalador diferente desse do repositório ou caso deseje trocar de idioma.

Por padrão, o sistema será instalado no idioma Inglês dos Estados Unidos. Para trocar para o idioma de outra região, será necessário executar os seguintes comandos no terminal com o Ubuntu já iniciado.
>Para este script, foi utilizado o [ICU Locale](https://www.localeplanet.com/icu/) Português do Brasil, que é o [`pt_BR`](https://www.localeplanet.com/icu/pt-BR/index.html) e o formato de codificação `UTF-8`

<br>

### Passo 1 - atualize os repositórios
```shell
sudo apt-get update
```

<br>

### Passo 2 - instale o pacote `locales`
```shell
sudo apt install locales -y
```
### Passo 3 - instale os pacotes de idioma
```shell
sudo apt-get install language-pack-pt language-pack-pt-base language-pack-gnome-pt language-pack-gnome-pt-base -y
```
>[!NOTE]
>Troque o `pt` ou `pt-base` pela sigla do seu idioma. 

<br>

### Passo 4 - gere o idioma
```shell
sed -i 's/^# *\(pt_BR.UTF-8\)/\1/' /etc/locale.gen
locale-gen
```
> Troque o `pt_BR` pelo ICU Locale da sua região e o `UTF-*` pelo formato de codificação da sua região.

<br>

### Passo 5 - inicialize com o sistema
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

<br>

## Instalar o Firefox como .deb no Ubuntu 22.04 sem ser pelo Snap
>[!NOTE]
> O instalador já corrige essa questão.

>[!IMPORTANT]
> O Ubuntu fez uma transição do deb para snap que não funciona no sistema que roda no Android devido as limitações root. [Entenda mais aqui sobre a transição](https://ubuntu.com/blog/chromium-in-ubuntu-deb-to-snap-transition).

<br>

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

<br>

### Passo 2 - Adicionando o repositório da Mozilla
Este é o PPA da Mozilla que deve ser adicionado a lista de fontes de softwares para que seu terminal possa instalar o pacote deb
```shell
 sudo add-apt-repository ppa:mozillateam/ppa -y
```
```shell
sudo apt update
```
> Use esse comando para atualizar esse repositório

<br>

### Passo 3 - priorizar o PPA/apt/deb no lugar do snap para o Firefox
Mesmo com o repositório instalado, pode ser que o terminal opte em instalar pelo snap. Para evitar isso, copie o seguinte código, cole no teminal e tecle `enter`
```shell
echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox
```

<br>

### Passo 4 - permita atualizações automáticas
O seguinte passo permite que o firefox faça atualizações automáticas quando instalado
```shell
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
```

<br>

### Passo 5 - instalando o Firefox
Agora, com tudo pronto, pode usar o `apt update` para atualizar os repositórios por garantia, ou já seguir direto para a instalação. O comando a seguir instala o Firefox
```shell
sudo apt install firefox -y
```

<br>

## Firefox crash
Caso o firefox mostre o alerta de erro e não consiga acessar nenhuma página. Será necessário alterar o nível de de segurança do sandbox para 0. Para isso, siga os seguintes passos:
1. Abra o Firefox
2. Digite no campo de pesquisa: `about: config` e dê `enter`
3. Vai aparecer um alerta. Coinfirme clicando em `Aceitar o risco e continuar` ou em `Accept the Risk and Continue`
4. Agora no campo de pesquisa: `Pesquisar preferências por nome` ou `Search preference name`, pesquise por `security.sandbox.content.level`
5. O resultado padrão será 4. Clique no lápis ✏️ ou dê duplo clique no valor e troque `4` por `0` e após tecle `enter` ou clique no check ☑️.
6. Reinicie o Firefox (Feche o navegador e abra novamente)


<br>

## Instalar o Chromium Web Browser como .deb no Ubuntu 22.04 sem ser pelo Snap
>[!NOTE]
> O instalador já corrige essa questão. <br>
> A versão instalada é a beta.

<br>

### Passo 1 - remova o Chromium
Pode ser que haja algum resíduo ou alguma versão Chromium instalada no sistema e deve ser removida antes de iniciar todo esse processo. Execute o comando abaixo:
```shell
sudo snap remove chromium
sudo apt autoremove --purge chromium* -y
```

<br>

### Passo 2 - adicionando o repositório da Chromium Team
Este é o PPA da Chromium Team que deve ser adicionado a lista de fontes de softwares para que seu terminal possa instalar o pacote deb. Você pode escolher entre a versão beta ou dev.
>[!NOTE]
>O repositório beta é mais estável que a dev

**Repositório do Chromium beta**
```shell
sudo add-apt-repository ppa:chromium-team/beta -y
```
**Repositório do Chromium dev**
```shell
sudo add-apt-repository ppa:chromium-team/dev -y
```
> [!TIP]
> Escolha um dos dois.


<br>

### Passo 3 - priorizar o PPA/apt/deb no lugar do snap para o Chromium
Mesmo com o repositório instalado, pode ser que o terminal opte em instalar pelo snap. Para evitar isso, copie o seguinte código, cole no teminal e tecle `enter`
```shell
echo 'Package: *
Pin: release o=LP-PPA-chromium-team-beta
Pin-Priority: 1001

Package: chromium*
Pin: origin "LP-PPA-chromium-team-beta"
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/chromium
```

<br>

### Passo 4 - remover a lista de pacotes padrão
A lista de pacotes padrão não traz suporte para a versão Jammy e por este motivo, o [passo 5](#passo-5---atualizar-a-lista-de-pacotes-para-instalar) trará uma solucão para que o `apt` possa instalar o Chromium, mas será necessário remover o buscador de lista padrão.
```shell
rm -rf /etc/apt/sources.list.d/chromium-team-ubuntu-beta-jammy.list
```

<br>

### Passo 5 - atualizar a lista de pacotes para instalar
Como explicado no [passo 4](#passo-4---remover-a-lista-de-pacotes-padrão), a lista do repositório não consegue encontrar versões deb para a versão Jammy do Ubuntu. Para resolver o problema será feito um downgrade da lista para a versão Bionic.
```shell
echo 'deb https://ppa.launchpadcontent.net/chromium-team/beta/ubuntu/ bionic main
# deb-src https://ppa.launchpadcontent.net/chromium-team/beta/ubuntu/ bionic  main' | sudo tee /etc/apt/sources.list.d/chromium-team-ubuntu-beta-bionic.list
```
> [!NOTE]
> Com esse comando o `apt install` irá instalar a versão bionic que está disponível para download.

### Passo 6 - permita atualizações automáticas
O seguinte passo permite que o firefox faça atualizações automáticas quando instalado
```shell
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-chromium-team-beta:bionic";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-chromium
```

<br>

### Passo 7 - instalando o Chromium
Agora, com tudo pronto, pode usar o `apt update` para atualizar os repositórios por garantia, ou já seguir direto para a instalação. O comando abaixo instala o Chromium beta.
```shell
sudo apt update
sudo apt install chromium-browser -y
```

<br>

### Passo 8 - corrigir a inicialização do Chromium
Como citado no "[problema de inicialização no Chromium Web Browser, Brave Browser, Vivaldi, Vscode e Figma-Linux](#problema-de-inicialização-no-chromium-web-browser-brave-browser-vivaldi-vscode-e-figma-linux)", o Chromium tem problema de inicialização em maquina virtual (VNC). O comando abaixo resolve o problema de inicialização
```shell
sed -i 's|Exec=chromium-browser|Exec=chromium-browser --no-sandbox|' /usr/share/applications/chromium-browser.desktop
```
>[!IMPORTANT]
> Esse comando não resolve o problema no caso de instalar apps PWAs do Chromium.




<br>

## Problema de inicialização no Chromium Web Browser, Brave Browser, Vivaldi, Vscode e Figma-Linux
>[!NOTE]
> O instalador já corrige essa questão para o VSCode que é instalado automaticamente no processo.

Esses programas listados possuem um problema de inicialização dentro do VNC e isso é devido a uma restrição ao `sandbox`. Para resolver esse problema, é necessário a adição de uma `option` ao comando de execução de cada um deles. Listarei o comando a ser colado no terminal para resolver o problema:
> Para solucionar este problema, utilizo o comando `sed` para procurar pela linha com o executável e substituir por outro comando de execução

<br>

### Resolvendo a inicialização do Chromium Web Browser
```shell
sed -i 's|Exec=chromium-browser|Exec=chromium-browser --no-sandbox|' /usr/share/applications/chromium-browser.desktop
```

<br>

### Resolvendo a inicialização do Brave Web Browser
```shell
sed -i 's|Exec=/usr/bin/brave-browser-stable|Exec=/usr/bin/brave-browser-stable --no-sandbox|' /usr/share/applications/brave-browser.desktop
```

<br>

### Resolvendo a inicialização do Vivaldi Web Browser
```shell
sed -i 's|Exec=/usr/bin/vivaldi-stable|Exec=/usr/bin/vivaldi-stable --no-sandbox|' /usr/share/applications/vivaldi-stable.desktop
```

<br>

### Resolvendo a inicialização do VSCode
```shell
sed -i 's|Exec=/usr/share/code/code|Exec=/usr/share/code/code --no-sandbox|' /usr/share/applications/code*.desktop
```

<br>

### Resolvendo a inicialização do Figma Linux
```shell
sed -i 's|Exec=/opt/figma-linux/figma-linux|Exec=/opt/figma-linux/figma-linux --no-sandbox|' /usr/share/applications/figma-linux.desktop
```

<br>
<br>

# Lista de aparelhos usados nos testes

> [!NOTE]
> 🟢 Funcionou/Passou. <br>
> 🔴 Não funcionou. <br>
> 🟠 Inconclusivo/Sem dados suficientes ou ainda sendo testado. <br>


| Dispositivo | Versão do Android | Memória interna |Memória RAM | Status |
| ------------- | --- | ------------- | ---- | --- |
|Samsung Galaxy S20 FE | 13 | 128GB | 6GB | 🟢 |
|Motorola Moto G22     | 12 | 128GB | 4GB | 🟢 |
|Samsung Galaxy Tab A9+| 13 | 64GB  | 4GB | 🔴 |
|Xiaomi Mi Pad 3       | 7  | 64GB  | 4GB | 🔴 |

> [!NOTE]
> Caso seu aparelho não esteja na lista e ao tentar fazer a instalação note que não deu certo, [relate o problema aqui](https://github.com/allytiago/Ubuntu-no-Android/issues).
