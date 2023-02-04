# FlutterDex
[README in English](https://github.com/mquerique/flutterdex/blob/master/README.en.md)

## Sobre
Uma aplicação criada em Flutter, utilizando gerenciamento de estados com BLoC e arquitetura Clean.

## Features
- Listagem online de Pokémon utilizando PokeAPI
- Criação de Pokémon personalizados com persistência local
- Exibição de detalhes sobre os Pokémon
- Versão light/dark
- Localização em português e em inglês (baseado no idioma do aparelho)

## Sobre o desenvolvimento
Aplicação desenvolvida visando cumprir um desafio técnico, assim como uma oportunidade de aprendizado.</br>
Decidi utilizar arquitetura Clean para possibilitar uma manutenção mais fácil, assim como uma estrutura robusta para possíveis novas features no futuro.</br>
Com a arquitetura definida, o próximo passo foi decidir uma ferramenta de gerenciamento de estados, para isso decidi na utilização do padrão BLoC, em conjunto com a lib flutter_bloc, que disponibiliza Widgets para facilitar a integração do padrão.</br>
Para evitar dependências internas e facilitar a disponibilidade dos serviços, utilizei o get_it como localizador de serviços.</br>
A persistência local foi desenvolvida utilizando shared_preferences para garantir uma implementação rápida, mas a arquitetura permite substituir essa camada facilmente no futuro, caso uma solução mais robusta for necessária.</br>

Esse foi o primeiro projeto onde combinei a utilização do padrão BLoC e arquitetura Clean, consegui aprender bastante e com certeza irei utilizar essa combinação novamente no futuro.

## Demo
<img src="https://github.com/mquerique/flutterdex/blob/master/assets/git_assets/app_sample.gif" alt= “” width="360" height="760">
