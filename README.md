# README

#Lista de Contatos

Nesta aplicação o usuário pode:
- Se cadastrar para utilizar a plataforma.
- Realizar login e logout.
- Gerenciar sua lista de contatos.
- Realizar pesquisa de endereços como ajuda ao cadastro de contatos.
- Excluir a sua própria conta.
Jornada do usuário
O usuário acessa a plataforma, realiza seu cadastro e em seguida faz seu login.
UEX Tecnologia 3
Assim que estiver dentro do sistema, os dados dos contatos previamente cadastrados são exibidos
na tela e então o usuário realiza o cadastro de um ou mais contatos utilizando um formulário
contendo os campos necessários para o cadastro.
A plataforma possui um sistema de ajuda para o preenchimento do endereço do contato, onde o
usuário pode informar alguns dados tais como, UF, cidade e um trecho do endereço e esse sistema
de ajuda apresenta então as possibilidades de endereço baseado na pesquisa, dessa forma o
usuário escolhe na lista qual o endereço lhe convém e tem os campos do formulário
correspondente preenchidos automaticamente.
Quando o usuário quer localizar um contato na lista, ele utiliza um filtro de texto que traz apenas os
contatos que contém o nome ou CPF equivalente ao termo pesquisado.
Sempre que o usuário clica no contato da lista, o mapa deve centralizar e marcar com um “pin” a
coordenada geográfica obtida através do cadastro.
O usuário pode realizar a exclusão e a edição dos dados dos contatos a qualquer momento.
Se desejar, o usuário pode remover a sua própria conta, o que faz com que todos os dados
cadastrados por ele sejam removidos da base de dados.

## Pré-requisitos

Antes de rodar o projeto, certifique-se de que você tenha as seguintes ferramentas instaladas no seu sistema:

- **Ruby** (Versão recomendada: 3.4.1)
- **Rails** (Versão recomendada:  7.2.2.1)

### Iniciando a Aplicação

1. Clone o repositório
  ```
    git clone ...
    cd Lista-de-Contatos
  ```
2. Instalar as depedências 
  ```
    bundle install
  ```
3. Crie o banco e rode as migrações
  ```
    rails db:create
    rails db:migrate
  ```
4. Inicie o servidor
  ```
    rails server
  ```
5. Abra o browser e acesse http://localhost:3000
6. Para rodar os testes execute:
```
  bundle exec rspec
```

