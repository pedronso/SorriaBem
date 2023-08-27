Feature: Gerenciamento de Paciente
  As a Usuario do sistema
  I want to registrar, editar, remover e exibir um paciente
  So that eu gerencie os pacientes do consultorio

  Background:
    Given que já estou logado no sistema como user, email "user1@email.com" e password "123456"
    Given Existe o Paciente de nome "Erick", cpf: "12312312312", email: "erick12@email.com" e Número de telefone: "11111111111"
    Given Existe o Paciente de nome "Lucas", cpf: "27272727272", email: "br27@email.com" e Número de telefone: "272727272727"
    And eu estou na pagina de gerenciamento de pacientes

  Scenario: Registrar novo paciente
    When eu clico no botão "Novo Paciente" para registrar um novo paciente
    Then e eu sou redirecionado para a página de gerenciamento de pacientes "patients/new"
    Then eu preencho o formulário de registro com os dados do paciente de nome: "Josias Silva", cpf: "09709709709", email: "josias@email.com" e Número de Telefone: "87999990000"
    And eu clico no botão escrito "Salvar" para salvar os dados do paciente
    Then eu sou redirecionado para a página do paciente "Josias Silva"
    And eu vejo os detalhes do paciente "Josias Silva" exibidos na página

  Scenario: Editar informações do paciente
    When eu clico no botão de gerenciamento "Ver Detalhes" do paciente "Erick"
    Then eu sou redirecionado para a página do paciente "Erick"
    And eu clico no botão com o nome de "Editar Paciente" para editar os dados
    Then eu sou redirecionado para a página de edição dos dados do paciente "Erick"
    When eu atualizo os dados do paciente com nome: "Erick Jr", cpf: "12312312312", email: "erick_jr@email.com" e Número de Telefone: "88888888888"
    And eu clico no botão "Salvar" para salvar os dados do paciente
    Then eu sou redirecionado para a página do paciente "Erick Jr"
    And eu vejo resultados de gerenciamento relacionados ao paciente "Erick Jr"

  Scenario: Tentar registrar paciente com CPF duplicado
    When eu clico no botão "Novo Paciente" para registrar um novo paciente
    Then e eu sou redirecionado para a página de gerenciamento de pacientes "patients/new"
    Then eu preencho o formulário de registro com os dados do paciente de nome: "Erick Jr", cpf: "12312312312", email: "erick_jr@email.com" e Número de Telefone: "88888888888"
    And eu clico no botão escrito "Salvar" para salvar os dados do paciente
    Then eu vejo uma mensagem de erro indicando que o CPF já está em uso "Cpf has already been taken"

  Scenario: Exibir detalhes do paciente
    When eu clico no botão de gerenciamento "Ver Detalhes" do paciente "Erick"
    Then eu sou redirecionado para a página do paciente "Erick"
    And eu vejo os detalhes do paciente "Erick" exibidos na página

  Scenario: Remover paciente
    When eu clico no botão de gerenciamento "Ver Detalhes" do paciente "Lucas"
    Then eu sou redirecionado para a página do paciente "Lucas"
    And eu vejo o botão com o nome de "Remover Paciente" para remover o paciente
    When eu clico no botão "Remover Paciente" para remover o paciente
    Then eu sou redirecionado para a pagina de gerenciamento dos pacientes
    And eu não vejo mais o paciente "Lucas" na lista de pacientes
    And vejo a mensagem "Patient was successfully destroyed" informando que o paciente foi deletado
