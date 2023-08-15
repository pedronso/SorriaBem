Given('Eu estou na pagina de busca de consultas') do
  visit search_appointments_path
end

When('Eu informo o periodo de agendamento') do
  fill_in 'start_date', with: '2023-08-01'
  fill_in 'end_date', with: '2023-08-31'
end

Then('Eu vejo uma lista de todas as consultas') do
  expect(page).to have_css('.appointment-card', count: Appointment.count)
end

When('Eu não informo um periodo de agendamento') do

end

When('Eu informo um periodo de agendamento valido') do
  fill_in 'start_date', with: '2023-08-01'
  fill_in 'end_date', with: '2023-08-15'
end

Then('Eu vejo uma lista de consultas dentro do periodo informado') do
  expect(page).to have_css('.appointment-card', count: Appointment.where(date: '2023-08-01'..'2023-08-15').count)
end

When('Eu informo um periodo de agendamento invalido') do
  fill_in 'start_date', with: '2023-08-15'
  fill_in 'end_date', with: '2023-08-01'
end

Then('Eu vejo uma mensagem de erro') do
  expect(page).to have_content('Período de agendamento inválido')
end

When('Eu informo um periodo de agendamento que não possui consultas') do
  fill_in 'start_date', with: '2023-09-01'
  fill_in 'end_date', with: '2023-09-15'
end

Then('Eu vejo uma mensagem informando que não há consultas no periodo') do
  expect(page).to have_content('Não há consultas agendadas no período informado')
end
