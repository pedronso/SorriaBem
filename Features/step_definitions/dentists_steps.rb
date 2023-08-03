# features/step_definitions/dentists_steps.rb
#cenario 1
Given('que já existe o dentista {string} com a especialidade {string} e outros dados') do |nome, especialidade|
  Dentist.create!(
    nome: nome,
    especialidade: especialidade,
    cpf: '11111111111',
    email: 'joao@example.com',
    cro: '123456',
    inicio_horario_atendimento: '13:00',
    termino_horario_atendimento: '19:00'
  )

  @dentista = Dentist.find_by(nome: nome)
end

Given('estou na pagina de busca de dentistas') do
  visit "/dentists"
end

When('eu pesquiso por {string} no campo {string}') do |valor, campo|
  fill_in campo, with: valor
end

Then('eu vejo resultados relacionados ao dentista {string}') do |nome_dentista|
  expect(page).to have_content(nome_dentista)
end

When('eu clico no botão escrito {string}') do |texto_do_botao|
  click_on 'Buscar'
end

When('eu vejo o link com o nome de {string}') do |nome_dentista|
  expect(page).to have_link(nome_dentista)
end

When('eu clico no link com o nome de  {string}') do |string|
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


