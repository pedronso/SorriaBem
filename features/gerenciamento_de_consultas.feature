Feature: Gerenciamento de Consultas
  As a Usuario do sistema
  I want to marcar, desmarcar e editar uma consulta
  So that eu gerencie as consultas do consultorio

  Background:
    Given que já estou logado no sistema como user, email "user1@email.com" e password "123456"
    And Existe o Paciente de nome "Branco Branco", cpf: "27271272727", email: "branco27@email.com" e Número de telefone: "272727272727" no sistema para as consultas
    And Existe o Médico de nome "Dr Drauzio Martela" com especialidade "Odontologia" no sistema
    Given que existe uma consulta marcada para o paciente "Branco Branco", dentista "Dr Drauzio Martela", data "2023-08-30" e horário "15:00"

  Scenario: Marcar uma consulta
    When eu estou na página de marcação de consulta
    And eu seleciono o paciente "Branco Branco" da lista
    And eu seleciono o dentista "Dr Drauzio Martela" da lista
    And eu preencho a data "2023-08-25" e horário "14:00" para a consulta
    And eu clico no botão de marcar consulta "Agendar Consulta"
    Then eu sou redirecionado para a página da consulta
    Then eu vejo os dados da ultima consulta criada

  Scenario: Tentar marcar uma consulta sem paciente
    When eu estou na página de marcação de consulta
    And eu clico no botão de marcar consulta "Agendar Consulta"
    Then eu vejo a mensagem de erro "Patient must exist"

  Scenario: Editar uma consulta
    When eu estou na página de visualizar consultas
    And eu clico no botão de "Detalhes do Agendamento" para a consulta do paciente "Branco Branco" e dentista "Dr Drauzio Martela"
    Then sou redirecionado para a pagina da consulta e vejo os dados do paciente "Branco Branco"
    And click no botao "Editar Consulta"
    And eu preencho a nova data "2023-08-26" e horário "15:00" para a consulta
    And eu clico no botão de "Update Appointment"
    Then eu sou redirecionado para a pagina da consulta
    And eu vejo os dados atualizados da consulta