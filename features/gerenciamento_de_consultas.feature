Feature: Gerenciamento de Consultas
  As a Usuario do sistema
  I want to marcar, desmarcar e editar uma consulta
  So that eu gerencie as consultas do consultorio

  Background:
    Given que já estou logado no sistema como user, email "user1@email.com" e password "123456"
    And Existe o Paciente de nome "Branco Branco", cpf: "27271272727", email: "branco27@email.com" e Número de telefone: "272727272727" no sistema para as consultas
    And Existe o Médico de nome "Dr Drauzio Martela" com especialidade "Odontologia" no sistema

  Scenario: Marcar uma consulta
    When eu estou na página de marcação de consulta
    And eu seleciono o paciente "Branco Branco" da lista
    And eu seleciono o dentista "Dr Drauzio Martela" da lista
    And eu preencho a data "2023-08-25" e horário "14:00" para a consulta
    And eu clico no botão de marcar consulta "Agendar Consulta"
    Then eu sou redirecionado para a página da consulta
    Then eu vejo os dados da ultima consulta criada

