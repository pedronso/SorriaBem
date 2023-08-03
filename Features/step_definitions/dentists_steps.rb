Given('que estou na pagina de busca de dentistas') do
  visit "/dentists"
end

When('eu pesquiso por {string} no campo {string}') do |valor, campo|
  fill_in campo, with: valor
end

Then('eu vejo resultados relacionados ao dentista {string}') do |string|
  expect(page).to have_content("Dentistas encontrados:")
  expect(page).to have_content(nome_dentista)
end

When('eu clico no botão escrito {string}') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then('eu sou redirecionado para a página do dentista {string}') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then('vejo as informações do dentista:') do |doc_string|
  pending # Write code here that turns the phrase above into concrete actions
end
