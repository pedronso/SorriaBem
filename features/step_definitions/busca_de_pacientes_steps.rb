Given('Eu tenho pacientes registrados com varios nomes') do
  @patients_with_names = create_list(:patient, 5)
end

When('Eu procuro por paciente por nome') do
  visit search_patients_path
end

When('Eu procuro por um paciente pelo nome') do
  @searched_patient = @patients_with_names.first
  fill_in 'query', with: @searched_patient.first_name
  click_on 'Buscar'
end

Then('Eu consigo ver a lista de pacientes que correspondem com o nome') do
  expect(page).to have_content(@searched_patient.full_name)
end

Given('Eu tenho pacientes registrados com varios CPFs') do
  @patients_with_cpf = create_list(:patient, 3, cpf: '123.456.789-00')
end

When('Eu busco um paciente por CPF') do
  @searched_patient = @patients_with_cpf.first
  fill_in 'query', with: @searched_patient.cpf
  click_on 'Buscar'
end

Then('Eu devo ver o paciente correspondente ao CPF') do
  expect(page).to have_content(@searched_patient.full_name)
  expect(page).to have_content(@searched_patient.cpf)
end

Given('Eu nao tenho pacientes registrados pelo nome dado') do
  # nao necessita de implementacao
end

Then('Eu devo ver a mensagem indicando nenhum resultado') do
  expect(page).to have_content('Nenhum paciente encontrado.')
end

Given('Eu nao tenho pacientes registrados pelo CPF correspondente') do
  # nao necessita de implementacao
end

When('Eu procuro por um paciente pelo CPF') do
  fill_in 'query', with: '999.999.999-99'
  click_on 'Buscar'
end

Given('Eu tenho pacientes registrados com nomes e CPFs correspondentes') do
  @patients_with_matching_names_and_cpf = create_list(:patient, 2, cpf: '11111111111')
end

When('Eu procuro por um paciente pelo nome e CPF') do
  @searched_patient = @patients_with_matching_names_and_cpf.first
  fill_in 'query', with: @searched_patient.first_name
  click_on 'Buscar'
end

Then('Eu devo ver uma lista de pacientes correspondentes pelo nome e CPF') do
  expect(page).to have_content(@searched_patient.full_name)
  expect(page).to have_content(@searched_patient.cpf)
end
