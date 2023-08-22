Given('Existe o Médico de nome {string} com especialidade {string} no sistema') do |nome, especialidade|
  Dentist.create!(
    nome: nome,
    especialidade: especialidade,
    cpf: '33333333333',
    email: 'drauzio@example.com',
    cro: '987654',
    inicio_horario_atendimento: '09:00',
    termino_horario_atendimento: '17:00'
  )
end

Given('Existe o Paciente de nome {string}, cpf: {string}, email: {string} e Número de telefone: {string} no sistema para as consultas') do |nome, cpf, email, telefone|
  Patient.create!(
    full_name: nome,
    cpf: cpf,
    email_address: email,
    phone_number: telefone
  )
end

When('eu estou na página de marcação de consulta') do
  visit new_appointment_path
end

When('eu seleciono o paciente {string} da lista') do |nome_paciente|
  select nome_paciente, from: 'appointment_patient_id'
end

When('eu seleciono o dentista {string} da lista') do |nome_dentista|
  #puts page.body
  select nome_dentista, from: 'appointment_dentist_id'
end

When('eu preencho a data {string} e horário {string} para a consulta') do |data, horario|
  fill_in 'appointment[date]', with: data
  fill_in 'appointment[time]', with: horario
end


When('eu clico no botão de marcar consulta {string}') do |string|
  click_button 'Agendar Consulta'
end

Then('eu sou redirecionado para a página da consulta') do
  expect(page).to have_current_path(appointment_path(Appointment.last))
end

def formatar_data(data)
  data.strftime('%d/%m/%Y')
end

def formatar_horario(horario)
  horario.strftime('%H:%M')
end

Then('eu vejo os dados da ultima consulta criada') do
  consulta = Appointment.last
  expect(page).to have_content("Paciente: #{consulta.patient.full_name}")
  expect(page).to have_content("Data: #{formatar_data(consulta.date)}")
  expect(page).to have_content("Horário: #{formatar_horario(consulta.time)}")
  expect(page).to have_content("Dentista: #{consulta.dentist.nome}")
end


