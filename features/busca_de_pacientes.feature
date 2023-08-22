Feature: Busca de paciente
  As a Usuario do sistema
  I want to buscar um paciente informando o seu nome ou CPF
  So that eu visualize o paciente desejado

  Background:
    Given que já estou logado no sistema como user, email "user1@email.com" e password "123456"
    Given Existe o Paciente de nome "Erik Brasil", cpf: "12312312311", email: "erickbr@email.com" e Número de telefone: "11111111117" no sistema
    And eu estou na pagina de busca de pacientes

  Scenario: Pesquisar e visualizar detalhes do paciente
    When eu pesquiso por "Erik Brasil" no campo "query" de paciente
    And eu clico no botão escrito "Buscar"
    And eu vejo o link com o nome de "Ver detalhes"
    Then eu sou redirecionado para a página do paciente "Erik Brasil" ao clicar no botão de Ver detalhes
    And vejo as informações do paciente "Erik Brasil"

  Scenario: Busca sem resultados
    When eu pesquiso por um nome de paciente que não existe no sistema no campo "query" de paciente
    And eu clico no botão escrito "Buscar"
    Then eu vejo a mensagem "Nenhum paciente encontrado" na nova tela de pacientes

  Scenario: Busca por CPF
    When eu pesquiso pelo cpf "12312312311" no campo "query" de paciente
    And eu clico no botão escrito "Buscar"
    Then eu vejo resultados relacionados ao paciente "Erik Brasil"
    And vejo o link com o nome de "Ver detalhes"
    Then eu sou redirecionado para a página do paciente "Erik Brasil" ao clicar no botão de "Ver detalhes" na busca por cpf
    And vejo as informações do paciente "Erik Brasil"

  Scenario: Busca com letras maiúsculas e minúsculas misturadas
    When eu pesquiso por "eRiK bRaSiL" no campo "query" de paciente
    And eu clico no botão escrito "Buscar"
    Then eu vejo resultados relacionados ao paciente "Erik Brasil"
    And vejo o link com o nome de "Ver detalhes"
    Then eu sou redirecionado para a página do paciente "Erik Brasil" ao clicar no botão de Ver detalhes
    And vejo as informações do paciente "Erik Brasil"

  Scenario: Busca por parte do nome
    When eu pesquiso por "Erik" no campo "query" de paciente
    And eu clico no botão escrito "Buscar"
    Then eu vejo resultados relacionados ao paciente "Erik Brasil"
    And vejo o link com o nome de "Ver detalhes"
    Then eu sou redirecionado para a página do paciente "Erik Brasil" ao clicar no botão de Ver detalhes
    And vejo as informações do paciente "Erik Brasil"
