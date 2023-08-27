Given('Existe o Paciente de nome {string}, cpf: {string}, email: {string} e Número de telefone: {string} no sistema') do |nome, cpf, email, telefone|
  Patient.create!(
    full_name: nome,
    cpf: cpf,
    email_address: email,
    phone_number: telefone
  )
end

Given('eu estou na pagina de busca de pacientes') do
  visit "/patients"
end

When('eu pesquiso por {string} no campo {string} de paciente') do |nome, campo|
  fill_in campo, with: nome
end

Then('eu sou redirecionado para a página do paciente {string} ao clicar no botão de Ver detalhes') do |nome_paciente|
  patient = Patient.find_by(full_name: nome_paciente)
  link_to_patient = page.find("a[href='/patients/1']")
  link_to_patient.click
  #click_on 'Ver detalhes'
end

Then('vejo as informações do paciente {string}') do |nome_paciente|
  #puts page.body
  paciente = Patient.find_by(full_name: nome_paciente)
  expect(page).to have_content(paciente.full_name)
  expect(page).to have_content(paciente.cpf)
  expect(page).to have_content(paciente.email_address)
  expect(page).to have_content(paciente.phone_number)
end


When('eu pesquiso por um nome de paciente que não existe no sistema no campo {string} de paciente') do |campo|
  fill_in campo, with: "Pedro Álvares Cabral da Fonseca Peres Silva Péricles Artur"
end

Then('eu vejo a mensagem {string} na nova tela de pacientes') do |mensagem|
  expect(page).to have_content(mensagem)
end

When('eu pesquiso pelo cpf {string} no campo {string} de paciente') do |cpf, campo|
  fill_in campo, with: cpf
end

Then('eu vejo resultados relacionados ao paciente {string}') do |nome_paciente|
  expect(page).to have_content(nome_paciente)
end

Then('vejo o link com o nome de {string}') do |nome_paciente|
  #puts page.body
  expect(page).to have_content("Ver detalhes")
  expect(page).to have_content(nome_paciente)
end

Then('eu sou redirecionado para a página do paciente {string} ao clicar no botão de {string} na busca por cpf') do |nome_paciente, nome_botao|
  #puts page.body
  click_on(nome_botao)
  #puts page.body
end

# apos esse, reaproveita-se o metodo de visualizar dados, confirma passed no cucumber!
