Given('Eu estou na pagina de registro') do
  visit new_dentist_path
end

When('Eu completo a informacao do dentista') do
  fill_in 'Nome', with: 'Dentista Teste'
  fill_in 'Especialidade', with: 'Odontologia Geral'
  click_on 'Create Dentist'
end

When('Eu clico no botao {string}') do |button_text|
  click_on button_text
end

Then('Eu consigo ver a mensagem de sucesso') do
  expect(page).to have_content('Dentist was successfully created.')
end

Then('Eu consigo ver os detalhes do novo dentista registrado') do
  expect(page).to have_content('Detalhes do Dentista')
  expect(page).to have_content('Nome do médico: Dentista Teste')
  expect(page).to have_content('Especialidade: Odontologia Geral')
end

Given('Eu estou na pagina de detalhes do dentista') do
  visit dentist_path(1)
end

When('Eu atualizo a informacao do dentista') do
  fill_in 'Nome', with: 'Novo Nome Dentista'
  fill_in 'Especialidade', with: 'Implantodontia'
end

Then('Eu consigo ver uma mensagem de sucesso') do
  expect(page).to have_content('Dentist was successfully updated.')
end

Then('Eu consigo ver os detalhes atualizados do dentista') do
  expect(page).to have_content('Detalhes do Dentista')
  expect(page).to have_content('Nome do médico: Novo Nome Dentista')
  expect(page).to have_content('Especialidade: Implantodontia')
end

Then('Eu consigo ver a confirmacao') do
  expect(page).to have_content('Você tem certeza?')
end

Then('Os detalhes do dentista nao serao mais visiveis') do
  expect(page).not_to have_content('Nome do médico: Novo Nome Dentista')
  expect(page).not_to have_content('Especialidade: Implantodontia')
end

Given('Eu tenho um dentista registrado') do
end

When('Eu visito a pagina de detalhes de dentista') do
  visit dentist_path(1)
end

Then('Eu consigo ver a informacao do dentista') do
  expect(page).to have_content('Detalhes do Dentista')
end

Given('Eu tenho multiplos dentistas registrados') do
end

When('Eu visito a pagina de lista de dentistas') do
  visit dentists_path
end

Then('Eu consigo ver a lista dos dentistas registrados') do
end

Then('Eu devo ver uma mensagem de sucesso') do
  pending
end
