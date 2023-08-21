Feature: Gerenciamento de Dentista
  As a Usuario do sistema
  I want to registrar, editar, remover e exibir um dentista
  So that eu gerencie os dentistas do consultorio

  # O cadastro de dentistas está em "VER TODOS OS DENTISTAS"
  # É necessário modificar isso!
  # Colocar no Front o botão de editar detalhes de dentista.

  Background:
    Given que já estou logado no sistema como user, email "user1@email.com" e password "123456"
    And estou na pagina de gerenciamento de dentistas

  Scenario: Registrar novo dentista
    When eu clico no botão "Novo Dentista" para registrar um novo dentista
    Then eu sou redirecionado para a página de "dentists/new"
    Then eu preencho o formulário de registro com os dados do dentista de nome: "Carlinhos Maia", cpf: "11223344556", email: "carl@email.com", especialidade: "cisos", cro: "123455", inicio_horario_atendimento: "13:00" e termino_horario_atendimento: "19:00".
    When eu clico no link com o nome de "Salvar"
    Then eu sou redirecionado para a página do dentista "Carlinhos Maia" ao clicar no botão de Salvar
    And eu vejo resultados de gerenciamento relacionados ao dentista "Carlinhos Maia" cpf: "11223344556", email: "carl@email.com", especialidade: "cisos", cro: "123455", inicio_horario_atendimento: "13:00" e termino_horario_atendimento: "19:00"