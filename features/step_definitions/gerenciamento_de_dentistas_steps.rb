Given('estou na pagina de gerenciamento de dentistas') do
  visit "/dentists"
  expect(page).to have_content('Novo Dentista')
end

Given('Existe o dentista de nome: {string}, cpf: {string}, email: {string}, especialidade: {string}, cro: {string}, inicio_horario_atendimento: {string} e termino_horario_atendimento: {string}.') do |nome, cpf, email, especialidade, cro, inicio_horario, termino_horario|
  Dentist.create!(
    nome: nome,
    especialidade: especialidade,
    cpf: cpf,
    email: email,
    cro: cro,
    inicio_horario_atendimento: inicio_horario,
    termino_horario_atendimento: termino_horario
  )
end

Given('existe o dentista {string} com CPF {string} e especialidade {string} na busca de dentistas') do |nome, cpf, especialidade|
  Dentist.create!(
    nome: nome,
    especialidade: especialidade,
    cpf: cpf,
    email: 'jo@example.com',
    cro: '999999',
    inicio_horario_atendimento: '08:00',
    termino_horario_atendimento: '18:00'
  )
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

  #puts page.body
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

Given('eu clico no botao de gerenciamento {string} do dentista {string}') do |botao, nome_dentista|
  dentist = Dentist.find_by(nome: nome_dentista)
  link_to_dentist = page.find("a[href='/dentists/#{dentist.id}']")
  link_to_dentist.click

  # puts page.body entrou na pagina do dentista Jo Soares e tem o botao de Editar Dentista
end

Then('eu sou redirecionado para a página do dentista {string}') do |nome_dentista|
  dentista = Dentist.find_by(nome: nome_dentista)
  expect(current_path).to eq("/dentists/#{dentista.id}")
end

When('eu clico no botao com o nome de {string}') do |nome_botao|
  click_on(nome_botao)
end

Then('eu sou redirecionado para a página de edição dos dados do dentista {string}') do |string|
  dentist = Dentist.find_by(nome: string)
  expect(current_path).to eq(edit_dentist_path(dentist))
end

When('eu atualizo os dados do dentista com nome: {string}, cpf: {string}, email: {string}, especialidade: {string}, cro: {string}, inicio_horario_atendimento: {string} e termino_horario_atendimento: {string}') do |nome, cpf, email, especialidade, cro, inicio_horario, termino_horario|
  fill_in 'Nome', with: nome
  fill_in 'CPF', with: cpf
  fill_in 'Email', with: email
  fill_in 'Especialidade', with: especialidade
  fill_in 'CRO', with: cro
  fill_in 'Inicio horario atendimento', with: inicio_horario
  fill_in 'Termino horario atendimento', with: termino_horario
end

When('eu clico no botão {string}') do |string|
  click_button 'Salvar'
end

Then('eu vejo os detalhes do dentista {string} exibidos na página') do |dentista_nome|
  #puts page.body
  dentista = Dentist.find_by(nome: dentista_nome)

  expect(page).to have_content("#{dentista.nome}")
  expect(page).to have_content("#{dentista.especialidade}")
  expect(page).to have_content("#{dentista.cpf}")
  expect(page).to have_content("#{dentista.email}")
  expect(page).to have_content("#{dentista.cro}")
  #expect(page).to have_content("#{dentista.inicio_horario_atendimento}")
  #expect(page).to have_content("#{dentista.termino_horario_atendimento}")

  formatted_inicio_horario_atendimento1 = dentista.inicio_horario_atendimento.strftime('%H:%M')
  expect(page).to have_content(formatted_inicio_horario_atendimento1)
  formatted_termino_horario_atendimento1 = dentista.inicio_horario_atendimento.strftime('%H:%M')
  expect(page).to have_content(formatted_termino_horario_atendimento1)
end

Then('eu sou redirecionado para a pagina de gerenciamento dos dentistas') do
  expect(current_path).to eq "/dentists"
end

Then('eu vejo uma mensagem de confirmação de exclusão {string}') do |message| # "Dentist was successfully destroyed"
  expect(page).to have_content(message)
end

Then('eu não vejo mais o dentista {string} na lista de dentistas') do |dentist_name|
  expect(page).not_to have_content(dentist_name)
end

Then('eu vejo uma mensagem de erro informando que {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end

