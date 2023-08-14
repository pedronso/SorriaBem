# features/paciente.feature
Feature: Busca de Paciente
  As a Usuario do sistema
  I want to buscar um paciente informando o seu nome ou CPF
  So that eu visualize o paciente desejado

    Scenario: Buscar paciente por nome
      Given Eu tenho pacientes registrados com varios nomes
      When Eu procuro por paciente por nome
      When Eu procuro por um paciente pelo nome
      Then Eu consigo ver a lista de pacientes que correspondem com o nome

    # Necessário implementar a busca por CPF!
    # Ao buscar um paciente registrado quando há vários registrados também
    # é interessante checar se ao clicar para ver as informações ele vai
    # voltar para a página de ver pacientes, deixo isso como uma OBS.
    """Scenario: Buscar paciente por CPF
      Given Eu tenho pacientes registrados com varios CPFs
      When Eu busco um paciente por CPF
      Then Eu devo ver o paciente correspondente ao CPF

    Scenario: Buscar paciente inexistente por nome
      Given Eu nao tenho pacientes registrados pelo nome dado
      When Eu procuro por paciente por nome
      Then Eu devo ver a mensagem indicando nenhum resultado

    Scenario: Buscar paciente inexistente por CPF
      Given Eu nao tenho pacientes registrados pelo CPF correspondente
      When Eu procuro por um paciente pelo CPF
      Then Eu devo ver a mensagem indicando nenhum resultado

    Scenario: Buscar paciente com resultados de nome e CPF
      Given Eu tenho pacientes registrados com nomes e CPFs correspondentes
      When Eu procuro por um paciente pelo nome e CPF
      Then Eu devo ver uma lista de pacientes correspondentes pelo nome e CPF
"""