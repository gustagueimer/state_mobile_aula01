# Aula 05 - Atividade 05/06: Evolução da aplicação que exibe produtos providos de uma API: Implementação de 'favoritar' usando estados

Uma aplicação desenvolvida seguindo os padrões do MVVM, separando o código em diferentes áreas de acordo com seu propósito. <br>
A Evolução atual consiste em adicionar um botão de favoritar para os produtos, com a funcionalidade de ele atualizar o estado da aplicação com o produto favoritado e com o icone mudando de cor caso for favorito ou não.

## Questionario
**1. O que significa gerenciamento de estado em uma aplicação Flutter?** <br>
*manter e atualizar dados referentes a interface do app* <br>

**2. Por que manter o estado diretamente dentro dos widgets pode gerar problemas em aplicações maiores?** <br>
*telas diferentes podem depender de mesmos dados, que precisam ser instânciados em cada tela ao invés de serem centralizados em um lugar só, e lidar com muitos states similarem em diferentes telas é mais complicado que lidar com um state só compartilhado entre diferentes telas* <br>

**3. Qual é o papel do método notifyListeners() na abordagem Provider?** <br>
*avisar os "ouvintes" do estado que houve uma mudança no estado para que eles atualizem* <br>

**4. Qual é a principal diferença conceitual entre Provider e Riverpod?** <br>
*providers são widgets enquanto o riverpod é apenas uma classe normal, o provider tem forte acoplamento no buildcontext da tela enquanto a implementação por riverpod é independente de buildcontext* <br>

**5. No padrão BLoC, por que a interface não altera diretamente o estado da aplicação?** <br>
*o BLoC trabalha com eventos executados pelo usuário que passam por uma camada de lógica antes de alterar o estado da aplicação* <br>

**6. Considere o fluxo do padrão BLoC:
`` Evento → Bloc → Novo estado → Interface ``
Qual é a vantagem de organizar o fluxo dessa forma?** <br>
*você tem um controle maior sobre os eventos que iniciam uma alteração de estado, bem como uma camada exclusiva para implementar processamento lógico sobre o evento antes de atualizar o estado e a interface* <br>

**7. Qual estratégia de gerenciamento de estado foi utilizada em sua implementação?** <br>
*riverpod* <br>

**8. Durante a implementação, quais foram as principais dificuldades encontradas?** <br> 
*conseguir implementar o riverpod no viewmodel, visto que o viewmodel em sí não é um widget* <br>

## Estrutura autal do código do projeto:

```
/lib 
|
|_/core
| |
| |_/errors
| |
| |_/network
|
|_/features
  |
  |_/product
    |
    |_/data
    | |
    | |_/datasources
    | |
    | |_/models
    | |
    | |_/repositories
    |
    |_/domain
    | |
    | |_/entities
    | |
    | |_/repositories
    |
    |_/presentation
      |
      |_/states
      |
      |_/pages
      |
      |_/viewmodels
```

## Como Rodar

### Requisitos 
`` Flutter 3.35.3 `` <br>
`` Dart 3.9.2 `` <br>

Clone este repositório em um folder de seu dispositivo seguindo os segiuntes passosem um terminal: <br>
```
git clone https://github.com/gustagueimer/mobile_arquitetura_01  
``` 
entre na pasta pelo terminal com: 
```
cd mobile_arquitetura_01
```
resolva as dependências com:
```
flutter pub get
```
e inicie a applicação com:
```
flutter run -d edge --web-browser-flag="--disable-web-security"
```
assim que a aplicação terminar de carregar no navegador, aperte no botão flutuante no canto inferior esquerdo e os produtos da API devem ser carregados na tela.