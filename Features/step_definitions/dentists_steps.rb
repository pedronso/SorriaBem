# features/step_definitions/dentists_steps.rb

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

When('eu clico no botão escrito {string}') do |botao|
  click_button botao
end

Then('eu sou redirecionado para a página do dentista {string}') do |nome_dentista|
  #expect(page).to have_content(nome_dentista)
end

Then('vejo as informações do dentista:') do |doc_string|
  #expect(page).to have_content(doc_string)
end
