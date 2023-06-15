Projeto de desafio proposto pela empresa verity para teste de candidatura a vaga iOS no cliente Carrefour.

O projeto tem a proposta de testar habilidades do candidato, tais como a construção de uma tela, com uma lista de usuários vindo de uma API pública do GitHub. Ao clicar em um usuário, o aplicativo executa duas novas requisições a duas APIs públicas do GitHub, uma para trazer os detalhes do usuário e outra para trazer a lista de repositórios que esse usuário possui.

Features:

- A tela inicial que possui a lista de usuários, está sendo carregada de 10 em 10 itens, possuindo uma paginação na API.
- Caso apresente algum erro na API, é exibido um modal customizado de erro.
- Em todos os momento que existe um carregamento de API, um modal de carregamento é exibido na tela.
- Ao clicar em um usuário da lista, é feito a duas requisições de API, a de detalhes do usuário e a lista de repositórios, e assim chamando a próxima tela.
- Na tela inicial, possui um botão de pesquisa no canto superior direito, para procurar por um username específico do GitHub.
- A tela do usuário possui um Header, com detalhes importantes do usuário e logo abaixo a lista de repositórios.
- Toda a construção de layout das telas foram através de ViewCode, usando o AutoLayout.
- O projeto foi construido com arquitetura MVVM.
- Foi usado apenas ferramentas nativas, dessa forma não é preciso instalar dependências para executar.
- Feito casos de teste unitários nas chamadas de APIs.
- Feito casos de teste unitário nas model com um retorno mockado localmente no APP.

Agradeço a oportunidade e espero atingir as expectativas da empresa. Fico no aguardo de um retorno.

Thiago Soares.