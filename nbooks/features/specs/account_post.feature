#language:pt

Funcionalidade: Cadastro de Usuário

    @smoke
    Cenario: Novo usuario

        Dado que o cliente informou seus dados cadastrais:
            |  name  |     Percilia Tester    |
            |  email |percilia.ninja@test.com |
            |password|         123456         |
        Quando faco uma requisicao POST para o servico accounts
        Entao o codigo de respostas deve ser "200"

    @smoke
    Cenario: Nao permite email duplicado

        Dado que o cliente informou seus dados cadastrais:
            |  name  |        Percilia Duplicada        |
            |  email |perciliar.ninja.duplicada@test.com|
            |password|              123456              |
        Mas o cliente ja esta cadastrado
        Quando faco uma requisicao POST para o servico accounts
        Entao o codigo de respostas deve ser "409"
        E deve ser exibido um JSON com a mensagem:
        """
        O e-mail informado, ja está cadastrado!
        """

    Esquema do Cenario: Campos obrigatorios

        Dado que o cliente informou seus dados cadastrais:
            |  name  |     <nome>    |
            |  email |     <email>   |
            |password|     <senha>   |
        Quando faco uma requisicao POST para o servico accounts
        Entao o codigo de respostas deve ser "409"
        E deve ser exibido um JSON com a mensagem:
        """
        <mensagem>
        """
        
        Exemplos:
        |nome            |email                   |senha |mensagem                   |
        |                |percilia1.ninja@test.com|123456|Nome deve ser obrigatório! |
        |Percilia1 Tester|                        |123456|Email deve ser obrigatório!|
        |Percilia1 Tester|percilia1.ninja@test.com|      |Senha deve ser obrigatório!|

