require_relative "../test_helper"

class DentistTest < ActiveSupport::TestCase
  def setup
    @dentist = Dentist.new(
      nome: "Dentist One",
      cpf: "12345678901",
      email: "dentist1@email.com",
      especialidade: "Odontologia Geral",
      cro: "12345",
      inicio_horario_atendimento: "09:00:00",
      termino_horario_atendimento: "17:00:00"
    )
  end

  test "should not save dentist without name" do
    @dentist.nome = nil
    assert_not @dentist.save, "Saved the dentist without a name"
  end

  test "should not save dentist with invalid CPF format" do
    @dentist.cpf = "12345"
    assert_not @dentist.save, "Saved the dentist with an invalid CPF format"
  end

  test "should not save dentist with end time before start time" do
    @dentist.inicio_horario_atendimento = "17:00:00"
    @dentist.termino_horario_atendimento = "08:00:00"
    assert_not @dentist.save, "Saved the dentist with end time before start time"
  end

  test "should find dentist by name" do
    search_name = "Dentist One"
    found_dentist = Dentist.find_by(nome: search_name)

    assert_not_nil found_dentist, "Dentist should be found by name"
    assert_equal @dentist.nome, found_dentist.nome, "Found dentist name does not match the expected name"
    assert_equal @dentist.cpf, found_dentist.cpf, "Found dentist cpf does not match the expected cpf"
    assert_equal @dentist.email, found_dentist.email, "Found dentist email does not match the expected email"
    assert_equal @dentist.especialidade, found_dentist.especialidade, "Found dentist specialization does not match the expected specialization"
    assert_equal @dentist.inicio_horario_atendimento, found_dentist.inicio_horario_atendimento, "Found dentist start time does not match the expected start time"
    assert_equal @dentist.termino_horario_atendimento, found_dentist.termino_horario_atendimento, "Found dentist end time does not match the expected end time"
  end

  test "should not save dentist with duplicate CPF" do
    duplicate_dentist = Dentist.new(
      nome: "Dentist Two",
      cpf: @dentist.cpf,
      email: "dentist2@example.com",
      especialidade: "Cardiologista",
      cro: "12346",
      inicio_horario_atendimento: "09:00:00",
      termino_horario_atendimento: "18:00:00"
    )

    assert_not duplicate_dentist.save, "Saved the dentist with duplicate CPF"
  end

  test "should find dentist by CPF" do
    search_cpf = "12345678901"
    found_dentist = Dentist.find_by(cpf: search_cpf)

    assert_not_nil found_dentist, "Dentist should be found by CPF"
    assert_equal @dentist.nome, found_dentist.nome, "Found dentist name does not match the expected name"
    assert_equal @dentist.cpf, found_dentist.cpf, "Found dentist cpf does not match the expected cpf"
    assert_equal @dentist.email, found_dentist.email, "Found dentist email does not match the expected email"
    assert_equal @dentist.especialidade, found_dentist.especialidade, "Found dentist specialization does not match the expected specialization"
  end

  test "should find no dentist for an empty name search or empty cpf" do
    search_name = ""
    search_cpf = ""
    found_dentist_name = Dentist.find_by(nome: search_name)
    found_dentist_cpf = Dentist.find_by(cpf: search_cpf)


    assert_nil found_dentist_name, "Found dentist should be nil for empty name search"
    assert_nil found_dentist_cpf, "Found dentist should be nil for empty CPF search"
  end
end
