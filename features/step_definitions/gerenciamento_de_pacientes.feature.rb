Given('Existe o Paciente de nome {string}, cpf: {string}, email: {string} e Número de telefone: {string}') do |nome, cpf, email, telefone|
  Patient.create!(
    full_name: nome,
    cpf: cpf,
    email_address: email,
    phone_number: telefone
  )
end

Given('eu estou na pagina de gerenciamento de pacientes') do
  visit "/patients"
end

When('eu clico no botão {string} para registrar um novo paciente') do |botao|
  click_on botao
end

Then('e eu sou redirecionado para a página de gerenciamento de pacientes {string}') do |string|
  #puts page.body
  expect(page).to have_content "Novo Paciente"
end

Then('eu preencho o formulário de registro com os dados do paciente de nome: {string}, cpf: {string}, email: {string} e Número de Telefone: {string}') do |nome, cpf, email, telefone|
  fill_in 'Nome do Paciente:', with: nome
  fill_in 'CPF:', with: cpf
  fill_in 'Endereço de email:', with: email
  fill_in 'Número de Telefone:', with: telefone
end

Then('eu clico no botão escrito {string} para salvar os dados do paciente') do |botao|
  click_on botao
end

Then('eu sou redirecionado para a página do paciente {string}') do |string|
  paciente = Patient.find_by(full_name: string)
  expect(current_path).to eq "/patients/#{paciente.id}"
end

Then('eu vejo os detalhes do paciente {string} exibidos na página') do |string|
  paciente = Patient.find_by(full_name: string)
  expect(page).to have_content(paciente.full_name)
  expect(page).to have_content(paciente.cpf)
  expect(page).to have_content(paciente.email_address)
  expect(page).to have_content(paciente.phone_number)
end

# puts page.body
#poderia haver uma refatoracao aqui para encontrar o linktopatient pelo paciente_nome

When('eu clico no botão de gerenciamento {string} do paciente {string}') do |botao, paciente_nome|
  patient = Patient.find_by(full_name: paciente_nome)
  link_to_patient = page.find("a[href='/patients/#{patient.id}']")
  link_to_patient.click
  #puts page.body #eh direcionado para o id/1
end

Then('eu clico no botão com o nome de {string} para editar os dados') do |botao|
  click_on(botao)
end

Then('eu sou redirecionado para a página de edição dos dados do paciente {string}') do |string|
  expect(page).to have_content("Editar Paciente")
end

When('eu atualizo os dados do paciente com nome: {string}, cpf: {string}, email: {string} e Número de Telefone: {string}') do |nome, cpf, email, telefone|
  fill_in 'Nome do Paciente:', with: nome
  fill_in 'CPF:', with: cpf
  fill_in 'Endereço de email:', with: email
  fill_in 'Número de Telefone:', with: telefone
end

When('eu clico no botão {string} para salvar os dados do paciente') do |botao|
  click_on botao
end

Then('eu vejo resultados de gerenciamento relacionados ao paciente {string}') do |paciente_nome|
  paciente = Patient.find_by(full_name: paciente_nome)

  expect(page).to have_content("#{paciente.full_name}")
  expect(page).to have_content("#{paciente.cpf}")
  expect(page).to have_content("#{paciente.email_address}")
  expect(page).to have_content("#{paciente.phone_number}")
end

Then('eu vejo uma mensagem de erro indicando que o CPF já está em uso {string}') do |string|
  expect(page).to have_content(string)
end

Then('eu vejo o botão com o nome de {string}') do |botao|
  expect(page).to have_button(botao)
end

Then('eu sou redirecionado para a pagina de gerenciamento dos pacientes') do
  expect(current_path).to eq '/patients'
end

Then('eu vejo o botão com o nome de {string} para remover o paciente') do |botao|
  expect(page).to have_content(botao)
end

When('eu clico no botão {string} para remover o paciente') do |botao_clicar|
  click_on(botao_clicar)
end

Then('eu não vejo mais o paciente {string} na lista de pacientes') do |paciente_nome|
  expect(page).not_to have_content(paciente_nome)
end

Then('vejo a mensagem {string} informando que o paciente foi deletado') do |mensagem|
  expect(page).to have_content(mensagem)
end

