Feature: Gerenciamento de consultas
  As a Usuario do sistema
  I want to marcar, desmarcar e editar uma consulta
  So that eu gerencie as consultas do consultorio

  Scenario: Marcar uma nova consulta
    Given estou na pagina de agendamento de consultas e existe o dentista com nome de "Marquinhos Crey Crey"
    When eu preencho o campo "Date" com "30/10/2023"
    And eu preencho o campo "Time" com "14:00"
    And eu seleciono no select "Dentist" da pagina com o dentista cujo nome é "Marquinhos Crey Crey"
    And eu clico no botão escrito de Agendar Consulta
    Then eu vejo a mensagem "Detalhes do Agendamento" que sinaliza o sucesso da criacao com os dados da consulta
