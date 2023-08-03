# features/dentist.feature
Feature: Busca de dentista
  As a Usuario do sistema
  I want to buscar um medico informando o seu nome
  So that eu visualize o paciente desejado

  Scenario: Pesquisar e visualizar detalhes do dentista
    Given que estou na pagina de busca de dentistas
    When eu pesquiso por "joao jose" no campo "query"
    Then eu vejo resultados relacionados ao dentista "joao jose"
    When eu clico no botão escrito "Ver detalhes"
    Then eu sou redirecionado para a página do dentista "joao jose"
    And vejo as informações do dentista:
      """
      Campo: Nome
      Valor: joao jose
      Campo: Especialidade
      Valor: cardio
      Campo: CPF
      Valor: 11111111111
      Campo: Email
      Valor: email@email.com
      Campo: CRO
      Valor: 123456
      Campo: Início do Horário de Atendimento
      Valor: 13:00
      Campo: Término do Horário de Atendimento
      Valor: 19:00
      """
