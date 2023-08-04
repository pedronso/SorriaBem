# features/step_definitions/dentists_steps.rb
#cenario 1

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
    email: 'maria@example.com',
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

When('eu pesquiso por {string} no campo {string}') do |valor, campo|
  fill_in campo, with: valor
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
  click_link(string)
end

Then('eu sou redirecionado para a página do dentista {string}') do |nome_dentista|
  expect(page).to have_content(nome_dentista)
  expect(page).to have_content(@dentista.cpf)
  expect(page).to have_content(@dentista.email)
  expect(page).to have_content(@dentista.cro)
end

Then('vejo as informações do dentista:') do |doc_string|
  expect(page).to have_content(@dentista.nome)
  expect(page).to have_content(@dentista.especialidade)
  expect(page).to have_content(@dentista.cpf)
  expect(page).to have_content(@dentista.email)
  expect(page).to have_content(@dentista.cro)
end

# cenario 2

Given('eu procuro por um dentista que não existe no sistema') do
  #o dentista nao existe, entao nao precisamos criar nem apagar nada
end

When('eu aperto o botão {string}') do |nome_do_botao|
  click_on 'Buscar'
end

Then('eu vejo a mensagem {string} na nova tela, informando que não foram encontrados resultados') do |mensagem|
  expect(page).to have_content(mensagem, wait: 5)
end

# cenario 3

Then('eu sou redirecionado para a página de resultados') do
  expect(current_path).to eq(dentists_path)
end

# cenario 4

Given('existe tambem o dentista {string} com a especialidade em {string}') do |nome1, especialidade1|
  Dentist.create!(
    nome: nome1,
    especialidade: especialidade1,
    cpf: '11111111119',
    email: 'joaogui@example.com',
    cro: '123450',
    inicio_horario_atendimento: '13:00',
    termino_horario_atendimento: '18:00'
  )

  @dentista3 = Dentist.find_by(nome: nome1)
end

Then('eu vejo ao menos dois links com o nome de {string}') do |nome_dentista|
  links = all('a', text: nome_dentista) #está correto apesar da IDE reclamar
  expect(links.count).to be >= 2
end

Then('eu vejo resultados relacionados ao dentista {string} e eu vejo resultados relacionados ao dentista {string}') do |nome1, nome2|
  expect(page).to have_content(nome1)
  expect(page).to have_content(nome2)
end



