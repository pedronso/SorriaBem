# features/dentist.feature
Feature: Busca de dentista
  As a Usuario do sistema
  I want to buscar um medico informando o seu nome
  So that eu visualize o paciente desejado

  Background: Dado que já existe o dentista "Joao Jose"
    Given que já existe o dentista "Joao Jose" com a especialidade "Cardio" e outros dados
    And estou na pagina de busca de dentistas

  Scenario: Pesquisar e visualizar detalhes do dentista
    When eu pesquiso por "Joao Jose" no campo "query"
    Then eu vejo resultados relacionados ao dentista "Joao Jose"
    When eu clico no botão escrito "Ver detalhes"
    Then eu sou redirecionado para a página do dentista "Joao Jose"
    And vejo as informações do dentista:
      """
      Campo: Nome
      Valor: Joao Jose
      Campo: Especialidade
      Valor: Cardio
      Campo: CPF
      Valor: 11111111111
      Campo: Email
      Valor: joao@example.com
      Campo: CRO
      Valor: 123456
      Campo: Início do Horário de Atendimento
      Valor: 13:00
      Campo: Término do Horário de Atendimento
      Valor: 19:00
      """
