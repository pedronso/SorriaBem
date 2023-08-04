Given('estou na pagina de agendamento de consultas e existe o dentista com nome de {string}') do |nome_dentista|
  Dentist.create!(
    nome: nome_dentista,
    especialidade: 'Alguma especialidade', # Substitua pela especialidade correta
    cpf: '11111111111',
    email: 'dentista@example.com',
    cro: '123456',
    inicio_horario_atendimento: '08:00',
    termino_horario_atendimento: '18:00'
  )
  visit '/agendar_consulta'
end

When('eu preencho o campo {string} com {string}') do |campo, valor|
  fill_in campo, with: valor
end

When('eu seleciono no select {string} da pagina com o dentista cujo nome é {string}') do |select_name, dentista_nome|
  select(dentista_nome, from: select_name)
end

When('eu clico no botão escrito de Agendar Consulta') do
  click_on 'Agendar Consulta'
end

Then('eu vejo a mensagem {string} que sinaliza o sucesso da criacao com os dados da consulta') do |mensagem|
  expect(page).to have_content(mensagem)
end

