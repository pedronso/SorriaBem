Given('Estou na pagina de registro') do
  visit new_patient_path
end

When('Eu completo as informacoes do paciente') do
  fill_in 'Nome', with: 'João da Silva'
  fill_in 'CPF', with: '12345678900'
  click_button 'Create Patient'
end

Then('Eu devo ver os detalhes do novo paciente registrado') do
  expect(page).to have_content('Detalhes do Paciente')
  expect(page).to have_content('Nome do paciente: João da Silva')
  expect(page).to have_content('CPF: 12345678900')
end

Given('Eu tenho um paciente registrado') do
  @paciente = Patient.create(nome: 'Carlos', cpf: '12345678900')
end

Given('Estou na pagina de detalhes do paciente') do
  visit patient_path(@paciente)
end

Given('Eu vejo os detalhes da pagina do paciente') do
  visit patient_path(@paciente)
end
When('Eu clico no botao "Editar"') do
  click_link 'Editar'
end

When('Eu atualizo a informacao do paciente') do
  fill_in 'Nome', with: 'Carlos'
  fill_in 'CPF', with: '98765432100'
end

When('Eu clico no botao "Salvar"') do
  click_button 'Salvar'
end

Then('Eu devo ver os detalhes atualizados do paciente') do
  expect(page).to have_content('Detalhes do Paciente')
  expect(page).to have_content('Nome do paciente: Carlos')
  expect(page).to have_content('CPF: 98765432100')
end

Then('Eu devo ver uma mensagem de confirmacao') do
  expect(page).to have_content('Você tem certeza?')
end

Then('Os detalhes do paciente nao serao mais visiveis') do
  expect(page).not_to have_content('Nome do paciente: Novo Nome')
  expect(page).not_to have_content('CPF: 987.654.321-00')
end

When('Eu visito a pagina de detalhes do paciente') do
  visit patient_path(@paciente)
end

Then('Eu devo ver a informacao do paciente') do
  expect(page).to have_content('Detalhes do Paciente')
end

Given('Eu tenho multiplos pacientes registrados') do
  @paciente1 = Patient.create(nome: 'Josias', cpf: '11111111111')
  @paciente2 = Patient.create(nome: 'Josicrey', cpf: '22222222222')
end

When('Eu visito a pagina de lista de pacientes') do
  visit patients_path
end

Then('Eu devo ver a lista com todos os pacientes registrados') do
  expect(page).to have_content('Lista de Pacientes')
end
