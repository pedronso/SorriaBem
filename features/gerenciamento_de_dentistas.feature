# features/dentist.feature
Feature: Gerenciamento de Dentista
  As a Usuario do sistema
  I want to registrar, editar, remover e exibir um dentista
  So that eu gerencie os dentistas do consultorio

"""
  # O cadastro de dentistas está em "VER TODOS OS DENTISTAS"
  # É necessário modificar isso!
    Scenario: Registrar um novo dentista
      Given Eu estou na pagina de registro
      When Eu completo a informacao do dentista
      And Eu clico no botao "Create Dentist"
      Then Eu consigo ver a mensagem de sucesso
      And Eu consigo ver os detalhes do novo dentista registrado

  # Colocar no Front o botão de editar detalhes de dentista.
    Scenario: Editar os detalhes de um dentista
      Given Eu estou na pagina de detalhes do dentista
      When Eu clico no botao "Editar"
      And Eu atualizo a informacao do dentista
      And Eu clico no botao "Salvar"
      Then Eu consigo ver uma mensagem de sucesso
      And Eu consigo ver os detalhes atualizados do dentista

    Scenario: Remover um dentista
      Given Eu estou na pagina de detalhes do dentista
      When Eu clico no botao "Remover"
      Then Eu consigo ver a confirmacao
      And Eu clico no botao "Confirmar"
      Then Eu devo ver uma mensagem de sucesso
      And Os detalhes do dentista nao serao mais visiveis

     Scenario: Exibir detalhes de um dentista
       Given Eu tenho um dentista registrado
       When Eu visito a pagina de detalhes de dentista
       Then Eu consigo ver a informacao do dentista

     Scenario: Exibir lista de dentistas
       Given Eu tenho multiplos dentistas registrados
       When Eu visito a pagina de lista de dentistas
       Then Eu consigo ver a lista dos dentistas registrados
"""
