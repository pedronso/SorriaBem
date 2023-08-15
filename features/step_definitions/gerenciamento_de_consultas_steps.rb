Given('estou na pagina de agendamento de consultas e existe o dentista com nome de {string}') do |nome_dentista|
  Dentist.create!(
    nome: nome_dentista,
    especialidade: 'Cirurgiao',
    cpf: '11111111115',
    email: 'dentista@email.com',
    cro: '123452',
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

When('eu clico no botão escrito de Agendar Consulta \(type submit)') do
  sleep 2
  click_on 'Agendar Consulta'
  puts page.body
end

When('sou redirecionado para a pagina da consulta criada') do
  #@consulta_id = Appointment.last.id
  visit "/appointments"
end

Then('eu vejo os dados da consulta {string} às {string} com o dentista {string}') do |data, horario, nome_dentista|
  puts page.body
  #expect(page).to have_content(mensagem)
  expect(page).to have_content("#{data}")
  expect(page).to have_content("#{horario}")
  expect(page).to have_content("#{nome_dentista}")
end



#Given('existe uma consulta agendada em {string} às {string} com o dentista {string}') do |data, horario, nome_dentista|
#  dentist = Dentist.find_by(nome: nome_dentista)
#  Appointment.create!(
#    date: data,
#    time: horario,
#    dentist: dentist
#  )end

#Given('estou na pagina de pesquisar consultas') do
#  visit '/appointments/search'
#end

#When('eu pesquiso por {string}') do |data_pesquisa|
#  fill_in 'Data', with: data_pesquisa
#end

#When('eu clico no botão escrito Pesquisar') do
#  click_on "Pesquisar"
#end

#When('eu clico no botão Detalhes do Agendamento da consulta em {string} às {string} com o dentista {string}') do |data, horario, nome_dentista|
#  click_on 'Detalhes do Agendamento'
#
#end

#When('eu clico no botão Editar Consulta') do
#  click_on "Editar Consulta"
#end

#When('eu clico no botão escrito Update Appointment') do
  #  click_on "Update Appointment"
  #end

#Then('eu vejo a consulta agendada em {string} às {string} com o dentista {string}') do |data, horario, nome_dentista|
#  expect(page).to have_content("#{data}")
#  expect(page).to have_content("#{horario}")
#  expect(page).to have_content("#{nome_dentista}")
#end
