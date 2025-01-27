# README

## Lista de Contatos

Plataforma web para gerenciar contatos, o usuário pode efetuar um cadastro e adicionar; editar e excluir contatos de sua lista. A aplicação possui integração com o google maps para a visualização da localização de cada contato e integração com o Via CEP para ajudar na bucar pelo endereço na hora do cadastro.

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

