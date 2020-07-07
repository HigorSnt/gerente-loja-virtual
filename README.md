<h1 align="center">
  <p>🛒 Gerente da Loja Virtual</p>
</h1>
<p align="center">
  <img alt="gif" src=".github/animation.gif" width="100px" />
</p>

## :bookmark: Sobre

Este aplicativo é útil para o dono de uma loja realizar o controle geral da sua loja. Logo, com este aplicativo o responsável pelo negócio pode alterar descrições, preços, adicionar/ remover fotos, entre outros detalhes de seus produtos, além de possibilitar a adição de novos. Por fim, ainda é possível atualizar os dados das compras realizadas pelos clientes.

A ideia por trás deste aplicativo é ser um complemento do app [Loja Virtual](https://github.com/HigorSnt/loja-virtual-app).

Essa aplicação foi desenvolvida durante a execução do curso [Criação de Apps Android e iOS com Flutter - Crie 16 Apps](https://www.udemy.com/course/curso-completo-flutter-app-android-ios/).

## :white_check_mark: Resultado

<p align="center">
  <img alt="gif" src="http://moms.inspireblog.com.br/images/svg/embreve.svg" width="200px" />
</p>

## :books: Documentação
**TODO**

## :pencil: Pré-Requisitos

- É necessário ter configurado o Flutter em sua máquina, algo que pode ser feito por meio [deste passo a passo](https://flutter.dev/docs/get-started/install).
- É necessário possuir um Emulador de Android ou IOS, algo que pode ser adquirido instalando o [Android Studio](https://developer.android.com/studio/run/emulator) ou o [Genymotion](https://www.genymotion.com/).
  - Uma alternativa à opção acima é rodar no seu próprio aparelho celular, para isso basta seguir os passos indicados nesse [artigo](https://medium.com/@marcoshenriqueh393/como-configurar-dispositivos-f%C3%ADsicos-no-flutter-b3acbe02e895).
- Além disso, é necessário ter uma conta no [Firebase](https://firebase.google.com/?hl=pt-br), após criar a conta ou realizar login é necessário criar um novo projeto e em seguida adicionar um dispostivo Android e baixar o arquivo `google-services.json`, onde vem a configuração necessária para realizar a conexão com o Firebase, e adicionar este arquivo no seguinte caminho `<raiz_projeto>/android/app/`. Ao final, a hierarquia de arquivos estará assim:
<p align="center">
  <img alt="firebase-config" src=".github/firebase-config.png" width="200px" />
</p>
  
> :warning: **Esta configuração é apenas para Android.**

## :boom: Utilização

1. Faça um clone do repositório:
  ```sh
    $ git clone https://github.com/HigorSnt/gerente-loja-virtual.git
  ```
2. Em um terminal, entre na pasta gerada pelo clone.
3. Para a execução é necessário ter conectado o celular via cabo USB ou estar com o emulador já funcionando. Em seguida execute o comando:
  ```sh
    $ flutter run
  ```

## :memo: Licença

Esse projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE.md) para mais detalhes.
