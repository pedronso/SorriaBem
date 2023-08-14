# features/paciente.feature
Feature: Busca de paciente
  As a Usuario do sistema
  I want to registrar, editar, remover e exibir um paciente
  So that eu gerencie os pacientes do consultorio

    Scenario: Registrar um novo paciente
      Given Estou na pagina de registro
      When Eu completo as informacoes do paciente
      And Eu clico no botao "Create Patient"
      Then Eu devo ver uma mensagem de sucesso
      And Eu devo ver os detalhes do novo paciente registrado

    # Falta criar o editar de paciente para os Scenarios!
    Scenario: Editar os detalhes de um paciente
      Given Eu vejo os detalhes da pagina do paciente
      When Eu clico no botao "Editar"
      And Eu atualizo a informacao do paciente
      And Eu clico no botao "Salvar"
      Then Eu devo ver uma mensagem de sucesso
      And Eu devo ver os detalhes atualizados do paciente

    Scenario: Remover um paciente
      Given Estou na pagina de detalhes do paciente
      When Eu clico no botao "Remover"
      Then Eu devo ver uma mensagem de confirmacao
      And Eu clico no botao "Confirmar"
      Then Eu devo ver uma mensagem de sucesso
      And Os detalhes do paciente nao serao mais visiveis

    Scenario: Exibir detalhes de um paciente
      Given Eu tenho um paciente registrado
      When Eu visito a pagina de detalhes do paciente
      Then Eu devo ver a informacao do paciente

    Scenario: Exibir lista de pacientes
      Given Eu tenho multiplos pacientes registrados
      When Eu visito a pagina de lista de pacientes
      Then Eu devo ver a lista com todos os pacientes registrados
