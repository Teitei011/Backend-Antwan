    Criação de uma base de dados: Uma base de dados foi criada para armazenar informações sobre usuários, dietas e exercícios.

    Implementação do esquema de usuário: Um esquema de usuário foi criado para descrever o modelo de dados para um usuário, incluindo informações como nome, email, senha e outras informações relevantes.

    Implementação do esquema de dieta: Um esquema de dieta foi criado para descrever o modelo de dados para uma dieta, incluindo informações como o nome do item de refeição, subtítulo e outros detalhes relevantes.

    Implementação do esquema de exercício: Um esquema de exercício foi criado para descrever o modelo de dados para um exercício, incluindo informações como o nome do grupo muscular, título e subtítulo dos exercícios.

    Implementação de rotas para usuários: Rotas foram implementadas para permitir que os usuários sejam criados, buscados, atualizados e excluídos.

    Implementação de rotas para dietas: Rotas foram implementadas para permitir que as dietas sejam adicionadas, buscadas, atualizadas e excluídas.

    Implementação de rotas para exercícios: Rotas foram implementadas para permitir que os exercícios sejam adicionados, buscados, atualizados e excluídos.

    Testes: Testes foram escritos para verificar a funcionalidade do esquema de usuário, dieta e exercício.

    Desenvolvimento de interface do usuário: Uma interface do usuário pode ser desenvolvida para permitir que os usuários interajam com as rotas e acessem as informações na base de dados.


    ## UX/UI

    - Create a Login screen:

        - Use TextField widgets for email and password input
        - Use a button widget for submitting the login form
        - Make a POST request to the API to authenticate the user using the email and password input
        - Store the authentication token in shared preferences for future use

    - Create a Home screen:

        - Use a FutureBuilder widget to fetch the user data from the API
        - Display the diets and exercises in separate ListView widgets
        - Use Card widgets to display each item in the ListView
        - Use a FloatingActionButton widget to add new items to the diet or exercise list

    - Create an Add Item screen:

        - Use TextField widgets for inputting the title and subtitle of the diet or exercise
        - Use a button widget for submitting the form
        - Make a POST request to the API to add the new item to the appropriate list

    - Create an Edit Item screen:

        - Use TextField widgets for editing the title and subtitle of the item
        - Use a button widget for submitting the form
        - Make a PUT request to the API to update the item in the appropriate list

    - Implement the logout functionality:

        - Use a RaisedButton widget to log out the user
        - Clear the authentication token from shared preferences.


Make sure to handle errors and show appropriate messages to the user in case of any API errors.

This is a high-level overview of how to build the user interface for your API in Flutter.









## TODO
- [] Remove all localhosts from the code and replace them with the actual API URL (http://192.168.15.33:3001/login)


## Servidores necessários
- [ ] Hostear o site
- [ ] Hostear o banco de dados
- [ ] Hostear o servidor de processamento interno