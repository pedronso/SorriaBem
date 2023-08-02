require_relative "../test_helper"

class DentistTest < ActiveSupport::TestCase
  def setup
    @dentist = Dentist.new(
      nome: "Dentist One",
      cpf: "12345678901",
      email: "dentist@example.com",
      especialidade: "Odontologia Geral",
      cro: "12345",
      inicio_horario_atendimento: "08:00:00",
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
end
