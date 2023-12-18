<!--
⚠️ Configurações adb
-->


> [!CAUTION]
> Esta é uma área de risco. Todas as configurações aqui listadas são modificações de nível de sistema. Caso não saiba o que está fazendo, busque descobrir o que cada coisa faz e como poder reverter a situação antes de executar os comandos. <br><br>
> Em alguns casos será necessário restaurar o aparelho aos padrões de fábrica, em outros casos poderá ser necessário ter que reinstalar o sistema operacional novamente no aparelho. <br><br>
> Os processos de adb podem sofrer alterações a depender do aparelho e versão do Android.
---

# Configurações pelo adb
Com essas configurações, será possível tirar algumas limitações do sistema que podem atrapalhar no desempenho ou uso do Ubuntu no Android.

| **Comece selecionando alguma das opções abaixo.** |
|--------------------|
||
|[**`Process 9 error` no Termux**](#process-9-error-no-termux)|
|  **↳** [**Passo 1 - ativar o modo desenvolvedor do Android**](#passo-1---ativar-o-modo-desenvolvedor-do-android)|
|  **↳** [**Passo 2 - dar as permissões de `adb` para o Termux**](#passo-2---dar-as-permissões-de-adb--para-o-termux)|
<!--
h1
|[** **]()|
h2
|  **↳** [** **]()|
h3
|    **↳** [** **]()|
-->
<br>
<br>

# `Process 9 error` no Termux
A partir do Android 12, o Termux apresentou instabilidades causados pelos cortes de processos fantasmas (phantom processes). Por padrão o sistema eliminará quaisquer processos fantasma ou que use muita CPU. Devido a esses cortes, o Termux pode apresentar o erro: `[Process completed (signal 9) - press Enter]` e encerrar o sistema Ubuntu e todos os processos de fundo do Termux. Existe uma solução, mas que utiliza do `adb`.

> [!WARNING]
> Se nunca usou ou nem conheçe o `adb`, essa documentação não trará detalhes aprofundados sobre a ferramenta e por isso, recomendo que se aprofunde mais em outras páginas, principalmente na do Android.
> - [Android Debug Bridge (adb)](https://developer.android.com/tools/adb)

> [!NOTE]
> O `adb` já vem instalado no sistema Android, portanto não precisa ser instalado. Para esse processo que visa resolver o problema do `process 9` será necessesário usar um app que possa ter permissões de desenvolvedor e que possa executar os comandos necessários para desativar o os processos fantasmas. Nessa documentação, será usado o próprio Termux, mas dependendo do aparelho, poderá ser necessário utilizar um computador.

### Passo 1 - ativar o modo desenvolvedor do Android
Esse modo vem desabilitado por padrão no sistema. Para ativa-lo, será necessário:
> [!NOTE]
> Os passos podem mudar a depender de como o fabricante do dispositivo optou em posicionar a função.

1. Abrir as configurações do sistema;
2. Ir até opção "sobre o telefone";
3. Acessar as informações do sistema;
4. Clicar várias vezes na opção chamada "número de compilação" até aparecer a solicitação de desbloqueio tipo o de tela.
5. Digite a senha que usa para desbloquear o aparelho;
6. Aparecerá um alerta toast de que o modo desenvolvedor está ativo;
7. Volte para o inicio das configurações do sistema.

### Passo 2 - dar as permissões de `adb` para o Termux
Para poder executar os comandos `adb` no Termux, será necessário conceder ao app as permissões de desenvolvedor.
> [!IMPORTANT]
> Para esse processo será necessário o uso do multi-janelas, caso contrário, não dará certo.

### Passo 3 - resolver o problema do `process 9 error`
> [!CAUTION]
> Como informado, todos os comandos de `adb` presentes nessa página são de modificação do sistema e os mesmos podem causar problemas que só serão resolvidos em caso de restauração aos padrões de fábrica e talvez até sejam irreversíveis. Tome cuidado, se continuar será por sua conta e risco.

> [!NOTE]
> Nem todos os aparelhos tem a possibilidade de usar o `adb` diretamente no dispositivo e serão dependentes de um computador com Windows, macOS ou Linux.

#### Passos pelo `feature flags`
> [!NOTE]
> Nem todos os dispositivos terão a possibilidade de usar esse passo.

1. Vá nas _**opções do desenvolvedor**_ nas _**configurações**_ do aparelho;
2. Procure pela opção _**feature flags**_;
3. Desative a opção `settings_enable_monitor_phantom_procs`;
4. Pronto!

#### Passos pelo Termux

1. Verifique os dispositivos pareados usando o comando abaixo. Certifique que Termux esteja pareado para continuar os próximos passos.
```shell
adb devices
```
2. Execute os seguintes comandos:
```shell
adb shell "/system/bin/device_config set_sync_disabled_for_tests persistent"
```
```shell
adb shell "/system/bin/device_config put activity_manager max_phantom_processes 2147483647"
```
```shell
adb shell settings put global settings_enable_monitor_phantom_procs false
```
3. Pronto! Poderá desativar as opções do desenvolvedor caso deseje.
