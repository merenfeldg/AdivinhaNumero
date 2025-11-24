# AdivinhaNumero
Um jogo simples de adivinhação para duas pessoas, onde uma escolhe um número e a outra tenta descobrir qual é. 
<br>
**Tecnologias utilizadas**: Swift e SwiftUI
<br>

<div align="center">

| Demonstração do Aplicativo |
|----------------------------|
| [Image](https://github.com/user-attachments/assets/2eb64f7e-cfac-41a2-9e07-ec6746a1f191) |

</div>
<br>

## Índice

I. [Visão Geral](#visão-geral)
II. [Arquitetura](#arquitetura)  
III. [Instalação](#instalação)  
VI. [Agradecimentos](#agradecimentos)

---

## Visão Geral

AdivinheNúmero é um projeto desenvolvido no início do curso presencial de 3 meses da **PUC-Rio**, chamado **Swift Foundation Graduação**, realizado em parceria com a **Ecoa** e a **Apple Developer Academy**.
<br><br>
O primeiro desafio proposto consistia em criar um aplicativo em **SwiftUI** de adivinhação de números, com o requisito de implementar o **algoritmo de busca binária** como parte da lógica do jogo.
<br><br>
A busca binária foi implementada de forma que a sugestão apareça logo abaixo do campo de entrada de texto. Os limites superior e inferior da busca são exibidos em um texto de apoio abaixo do título, indicando ao usuário que o número a ser adivinhado está dentro desse intervalo.

---

## Arquitetura

O projeto segue uma arquitetura baseda em **MVVM (Model-View-ViewModel)**, com uma **separação clara entre as camadas de domínio e de interface**.

### Camadas da arquitetura:

 - **Domain**:
   - **Models**: Tem o papel de representar os dados que vao ser exibidos na tela
   - **Logics**: Classe responsável por implementar as **regras** e a **lógica do jogo**, controlando o comportamento e o fluxo das ações durante a execução.
   - **Enums**: Utilizados para representar o resultado da comparação e outro define a resposta da lógica do jogo.
   <br>
 - **UserInterface**:
   - **Screens**: Contém o **código da tela principal** do aplicativo, juntamente com suas subviews, que têm como objetivo organizar e estruturar partes específicas da interface.
     - **Subviews**: **Representam seções separadas da tela**, utilizadas para manter o código mais organizado e facilitar a leitura e manutenção
   - **Components**: Pasta que reúne os códigos dos **componentes visuais** utilizados na construção das telas do aplicativo
   - **Controllers**: Classe observável pela tela principal, **responsável pelo gerenciamento de estado da tela** e emitir atualizações para a view com base nas respostas da lógica do jogo
   - **States**: Enum que representam o estados da tela principal.
        - **Initial**: Estado inicial do jogo, no qual o primeiro jogador irá inserir o número que o segundo jogador deverá adivinhar.
        - **NotGuessedNumber**: Estado em que o segundo jogador ainda não acertou o número escolhido pelo primeiro jogador, havendo uma nova tentativa com uma nova sugestão.
        - **Win**: Estado de vitória, no qual o segundo jogador acerta o número escolhido pelo primeiro jogador.


---

## Instalação

### Pré-requisitos:
- Xcode (versão mais recente disponível na App Store)
- Swift
- Git

### Instalação:

1. Clone o repositório do GitHub:
```bash
git clone https://github.com/merenfeldg/AdivinhaNumero.git
cd AdivinhaNumero
```

<br>

---

## Agradecimentos

Obrigado ao Ricardo Almeida, ao Victor e à Flora por esses três meses de curso no Swift Foundation Graduação. Foram meses de muito aprendizado em desenvolvimento iOS e design. 
