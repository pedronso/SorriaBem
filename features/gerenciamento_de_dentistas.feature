Feature: Gerenciamento de Dentista
  As a Usuario do sistema
  I want to registrar, editar, remover e exibir um dentista
  So that eu gerencie os dentistas do consultorio

  Background:
    Given que já estou logado no sistema como user, email "user1@email.com" e password "123456"
    Given Existe o dentista de nome: "Rock Lee", cpf: "11223344557", email: "rock@email.com", especialidade: "Massa", cro: "123450", inicio_horario_atendimento: "13:00" e termino_horario_atendimento: "19:00".
    Given existe o dentista "Jo Soares" com CPF "12345123456" e especialidade "Analise" na busca de dentistas
    Given existe o dentista "Naruto Uzumaki" com CPF "98765432100" e especialidade "Odontologia Ninja"
    And estou na pagina de gerenciamento de dentistas

  Scenario: Registrar novo dentista
    When eu clico no botão "Novo Dentista" para registrar um novo dentista
    Then eu sou redirecionado para a página de "dentists/new"
    Then eu preencho o formulário de registro com os dados do dentista de nome: "Carlinhos Maia", cpf: "11223344556", email: "carl@email.com", especialidade: "cisos", cro: "123455", inicio_horario_atendimento: "13:00" e termino_horario_atendimento: "19:00".
    When eu clico no link com o nome de "Salvar"
    Then eu sou redirecionado para a página do dentista "Carlinhos Maia" ao clicar no botão de Salvar
    And eu vejo resultados de gerenciamento relacionados ao dentista "Carlinhos Maia" cpf: "11223344556", email: "carl@email.com", especialidade: "cisos", cro: "123455", inicio_horario_atendimento: "13:00" e termino_horario_atendimento: "19:00"

  Scenario: Editar dados do dentista
    And eu clico no botao de gerenciamento "Ver Detalhes" do dentista "Jo Soares"
    Then eu sou redirecionado para a página do dentista "Jo Soares"
    When eu clico no botao com o nome de "Editar Dentista"
    Then eu sou redirecionado para a página de edição dos dados do dentista "Jo Soares"
    When eu atualizo os dados do dentista com nome: "Jo Soares Jr", cpf: "12345123456", email: "jo_jr@email.com", especialidade: "Analise Dentaria", cro: "999999", inicio_horario_atendimento: "10:00" e termino_horario_atendimento: "18:00"
    And eu clico no botão "Salvar"
    Then eu sou redirecionado para a página do dentista "Jo Soares Jr" ao clicar no botão de Salvar
    And eu vejo resultados de gerenciamento relacionados ao dentista "Jo Soares Jr" cpf: "12345123456", email: "jo_jr@email.com", especialidade: "Analise Dentaria", cro: "999999", inicio_horario_atendimento: "10:00" e termino_horario_atendimento: "18:00"

  Scenario: Exibir detalhes de um dentista
    Given estou na pagina de busca de dentistas
    When eu clico no botao de gerenciamento "Ver Detalhes" do dentista "Rock Lee"
    Then eu sou redirecionado para a página do dentista "Rock Lee"
    And eu vejo os detalhes do dentista "Rock Lee" exibidos na página

  Scenario: Remover um dentista
    When eu clico no botao de gerenciamento "Ver Detalhes" do dentista "Naruto Uzumaki"
    And eu clico no botao com o nome de "Remover Dentista"
    Then eu sou redirecionado para a pagina de gerenciamento dos dentistas
    And eu vejo uma mensagem de confirmação de exclusão "Dentist was successfully destroyed"
    And eu não vejo mais o dentista "Naruto Uzumaki" na lista de dentistas

  Scenario: Tentativa de cadastrar dentista com nome contendo apenas números
    When eu clico no botão "Novo Dentista" para registrar um novo dentista
    Then eu sou redirecionado para a página de "dentists/new"
    And eu preencho o formulário de registro com os dados do dentista de nome: "123456", cpf: "11223344556", email: "123456@email.com", especialidade: "cisos", cro: "123455", inicio_horario_atendimento: "13:00" e termino_horario_atendimento: "19:00".
    When eu clico no link com o nome de "Salvar"
    And eu vejo uma mensagem de erro informando que "Nome não pode conter apenas números"
