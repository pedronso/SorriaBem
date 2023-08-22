Given("que já estou logado no sistema como user, email {string} e password {string}") do |email, password|
  @email = email
  @password = password
  User.create!(email: email, password: password)

  visit new_user_session_path
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Log in'
end

Given('que já existe o dentista {string} com a especialidade {string} e outros dados,que já existe o dentista {string} com a especialidade {string} e outros dados') do |nome1, especialidade1, nome2, especialidade2|
  Dentist.create!(
    nome: nome1,
    especialidade: especialidade1,
    cpf: '11111111111',
    email: 'joao@example.com',
    cro: '123456',
    inicio_horario_atendimento: '13:00',
    termino_horario_atendimento: '19:00'
  )

  Dentist.create!(
    nome: nome2,
    especialidade: especialidade2,
    cpf: '22222222222',
    email: 'case@example.com',
    cro: '654321',
    inicio_horario_atendimento: '10:00',
    termino_horario_atendimento: '17:00'
  )

  @dentista = Dentist.find_by(nome: nome1)
  @dentista2 = Dentist.find_by(nome: nome2)
end

Given('estou na pagina de busca de dentistas') do
  visit "/dentists"
end

When('eu pesquiso por {string} no campo {string}') do |nome, campo|
  fill_in campo, with: nome
end

Then('eu vejo resultados relacionados ao dentista {string}') do |nome_dentista| #serviu para o cenario 1 e o cenario 3 tambem
  expect(page).to have_content(nome_dentista)
end

When('eu clico no botão escrito {string}') do |texto_do_botao|
  click_on 'Buscar'
end

When('eu vejo o link com o nome de {string}') do |nome_dentista|
  expect(page).to have_link(nome_dentista)
end

When('eu clico no link com o nome de {string}') do |string|
  click_on(string)
end

Then('eu sou redirecionado para a página do dentista {string} ao clicar no botão de Ver Detalhes') do |nome_do_dentista|
  #puts page.body
  expect(page).to have_content(nome_do_dentista)
  click_link("Ver detalhes", href: "/dentists/#{Dentist.find_by(nome: nome_do_dentista).id}")
end

def formatting_hour(hour)
  # refatorando metodo, pois a conversão para a data é necessária pois o dado recebido vem no formato "2000-01-01 13:00:00 UTC", e desejamos apenas horas e minutos
  hour.strftime('%H:%M')
end

Then('vejo as informações do dentista') do |doc_string|
  formatted_inicio_horario_atendimento = formatting_hour(@dentista.inicio_horario_atendimento)
  formatted_termino_horario_atendimento = formatting_hour(@dentista.termino_horario_atendimento)

  expect(page).to have_content(@dentista.nome)
  expect(page).to have_content(@dentista.especialidade)
  expect(page).to have_content(@dentista.cpf)
  expect(page).to have_content(@dentista.email)
  expect(page).to have_content(@dentista.cro)

  expect(page).to have_content(formatted_inicio_horario_atendimento)
  expect(page).to have_content(formatted_termino_horario_atendimento)
end

Given('eu procuro por um dentista que não existe no sistema') do
  #o dentista nao existe, entao nao precisamos criar o dentista, apenas situacional do given
end

Then('eu vejo a mensagem {string} na nova tela, informando que não foram encontrados resultados') do |mensagem|
  expect(page).to have_content(mensagem)
end

Given('existe tambem o dentista {string} com a especialidade em {string}') do |nome1, especialidade1|
  Dentist.create!(
    nome: nome1,
    especialidade: especialidade1,
    cpf: '11111111119',
    email: 'joaogui1@example.com',
    cro: '123450',
    inicio_horario_atendimento: '13:00',
    termino_horario_atendimento: '18:00'
  )

  @dentista3 = Dentist.find_by(nome: nome1)
end

Then('eu vejo resultados relacionados ao dentista {string} e eu vejo resultados relacionados ao dentista {string} e tambem vejo o botao de Ver Detalhes') do |nome1, nome2|
  expect(page).to have_content(nome1)
  expect(page).to have_content(nome2)
  expect(page).to have_link("Ver detalhes", href: "/dentists/#{Dentist.find_by(nome: nome1).id}")
  expect(page).to have_link("Ver detalhes", href: "/dentists/#{Dentist.find_by(nome: nome2).id}")
end

Given('existe o dentista {string} com CPF {string} e especialidade {string}') do |nome, cpf , especialidade|
  Dentist.create!(
    nome: nome,
    especialidade: especialidade,
    cpf: cpf,
    email: 'joao_bas2@example.com',
    cro: '777777',
    inicio_horario_atendimento: '14:00',
    termino_horario_atendimento: '20:00'
  )
end

