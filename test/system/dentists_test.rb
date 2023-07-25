require "application_system_test_case"

class DentistsTest < ApplicationSystemTestCase
  setup do
    @dentist = dentists(:one)
  end

  test "visiting the index" do
    visit dentists_url
    assert_selector "h1", text: "Dentists"
  end

  test "should create dentist" do
    visit dentists_url
    click_on "New dentist"

    fill_in "Cpf", with: @dentist.cpf
    fill_in "Cro", with: @dentist.cro
    fill_in "Email", with: @dentist.email
    fill_in "Especialidade", with: @dentist.especialidade
    fill_in "Inicio horario atendimento", with: @dentist.inicio_horario_atendimento
    fill_in "Nome", with: @dentist.nome
    fill_in "Termino horario atendimento", with: @dentist.termino_horario_atendimento
    click_on "Create Dentist"

    assert_text "Dentist was successfully created"
    click_on "Back"
  end

  test "should update Dentist" do
    visit dentist_url(@dentist)
    click_on "Edit this dentist", match: :first

    fill_in "Cpf", with: @dentist.cpf
    fill_in "Cro", with: @dentist.cro
    fill_in "Email", with: @dentist.email
    fill_in "Especialidade", with: @dentist.especialidade
    fill_in "Inicio horario atendimento", with: @dentist.inicio_horario_atendimento
    fill_in "Nome", with: @dentist.nome
    fill_in "Termino horario atendimento", with: @dentist.termino_horario_atendimento
    click_on "Update Dentist"

    assert_text "Dentist was successfully updated"
    click_on "Back"
  end

  test "should destroy Dentist" do
    visit dentist_url(@dentist)
    click_on "Destroy this dentist", match: :first

    assert_text "Dentist was successfully destroyed"
  end
end
