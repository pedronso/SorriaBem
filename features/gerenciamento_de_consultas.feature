Feature: Gerenciamento de Consultas
  As a Usuario do sistema
  I want to marcar, desmarcar e editar uma consulta
  So that eu gerencie as consultas do consultorio

  Scenario: Marcar uma nova consulta
    Given estou na pagina de agendamento de consultas e existe o dentista com nome de "Marquinhos Crey Crey"
    When eu preencho o campo "Date" com "30/10/2023"
    And eu preencho o campo "Time" com "14:00"
    And eu seleciono no select "Dentist" da pagina com o dentista cujo nome é "Marquinhos Crey Crey"
    When eu clico no botão escrito de Agendar Consulta (type submit)
    And sou redirecionado para a pagina da consulta criada
    Then eu vejo a mensagem "Appointment was successfully created"

  #Scenario: Editar detalhes de uma consulta existente
  #  Given existe uma consulta agendada em "05/08/2023" às "16:00" com o dentista "Marquinhos Crey Crey"
  #  And estou na pagina de pesquisar consultas
  #  When eu pesquiso por "05/08/2023"
  #  And eu clico no botão escrito Pesquisar
  #  And eu clico no botão Detalhes do Agendamento da consulta em "05/08/2023" às "16:00" com o dentista "Marquinhos Crey Crey"
  #  And eu clico no botão Editar Consulta
  #  And eu preencho o campo "data" com "06/08/2023"
  #  And eu preencho o campo "horario" com "17:30"
  #  And eu clico no botão escrito Update Appointment
  #  Then eu vejo a consulta agendada em "06/08/2023" às "17:30" com o dentista "Marquinhos Crey Crey"
