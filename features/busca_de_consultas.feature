Feature: Busca de Consultas
  As a Usuario do sistema
  I want to buscar uma consulta informando o periodo de agendamento
  So that eu visualize a consulta desejada

  Scenario: Buscar todas as consultas
    Given Eu estou na pagina de busca de consultas
    When Eu informo o periodo de agendamento
    And Eu clico no botao "Buscar"
    Then Eu vejo uma lista de todas as consultas

  Scenario: Buscar consultas por periodo vazio
    Given Eu estou na pagina de busca de consultas
    When Eu não informo um periodo de agendamento
    And Eu clico no botao "Buscar"
    Then Eu vejo uma lista de todas as consultas

  Scenario: Buscar consultas por periodo valido
    Given Eu estou na pagina de busca de consultas
    When Eu informo um periodo de agendamento valido
    And Eu clico no botao "Buscar"
    Then Eu vejo uma lista de consultas dentro do periodo informado

  Scenario: Buscar consultas por periodo invalido
    Given Eu estou na pagina de busca de consultas
    When Eu informo um periodo de agendamento invalido
    And Eu clico no botao "Buscar"
    Then Eu vejo uma mensagem de erro

  Scenario: Buscar consultas por periodo sem resultados
    Given Eu estou na pagina de busca de consultas
    When Eu informo um periodo de agendamento que não possui consultas
    And Eu clico no botao "Buscar"
    Then Eu vejo uma mensagem informando que não há consultas no periodo
