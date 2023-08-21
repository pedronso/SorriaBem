Given('estou na pagina de gerenciamento de dentistas') do
  visit "/dentists"
  expect(page).to have_content('Novo Dentista')
end

When('eu clico no botão {string} para registrar um novo dentista') do |botao|
  click_on botao
end

Then('eu sou redirecionado para a página de {string}') do |pagina|
  expect(current_path).to eq "/dentists/new"
end

Then('eu preencho o formulário de registro com os dados do dentista de nome: {string}, cpf: {string}, email: {string}, especialidade: {string}, cro: {string}, inicio_horario_atendimento: {string} e termino_horario_atendimento: {string}.') do |nome, cpf, email, especialidade, cro, inicio_horario, termino_horario|
  fill_in 'Nome', with: nome
  fill_in 'CPF', with: cpf
  fill_in 'Email', with: email
  fill_in 'Especialidade', with: especialidade
  fill_in 'CRO', with: cro
  fill_in 'Inicio horario atendimento', with: inicio_horario
  fill_in 'Termino horario atendimento', with: termino_horario

  puts page.body
end

Then('eu sou redirecionado para a página do dentista {string} ao clicar no botão de Salvar') do |dentista_nome|
  dentista = Dentist.find_by(nome: dentista_nome)
  expect(page).to have_current_path("/dentists/#{dentista.id}")
end

Then('eu vejo resultados de gerenciamento relacionados ao dentista {string}') do |nome_dentista|
  expect(page).to have_content(nome_dentista)
end

Then('eu vejo resultados de gerenciamento relacionados ao dentista {string} cpf: {string}, email: {string}, especialidade: {string}, cro: {string}, inicio_horario_atendimento: {string} e termino_horario_atendimento: {string}') do |nome, cpf, email, especialidade, cro, inicio_horario, termino_horario|
  details_element = page.find('.dentist-details')

  expect(details_element).to have_content(nome)
  expect(details_element).to have_content("Especialidade: #{especialidade}")
  expect(details_element).to have_content("CPF: #{cpf}")
  expect(details_element).to have_content("Email: #{email}")
  expect(details_element).to have_content("CRO: #{cro}")
  expect(details_element).to have_content("Início do Horário de Atendimento: #{inicio_horario}")
  expect(details_element).to have_content("Término do Horário de Atendimento: #{termino_horario}")
end




