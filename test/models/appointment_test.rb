require_relative "../test_helper"

class AppointmentTest < ActiveSupport::TestCase
  def setup
    @dentist = Dentist.create!(
      nome: "Dentist One",
      cpf: "12345668901",
      email: "dentist@example.com",
      especialidade: "Odontologia Geral",
      cro: "65478",
      inicio_horario_atendimento: "08:00:00",
      termino_horario_atendimento: "17:00:00"
    )

    @appointment = Appointment.new(
      date: Date.tomorrow,
      time: "14:30:00",
      dentist: @dentist
    )
  end

  test "should save a valid appointment" do
    assert @appointment.save, "Failed to save the valid appointment"
  end

  test "should not save appointment without a date" do
    @appointment.date = nil
    assert_not @appointment.save, "Saved the appointment without a date"
  end

  test "should not save appointment with a past time" do
    @appointment.date = Date.yesterday
    @appointment.time = "12:00:00"
    assert_not @appointment.save, "Saved the appointment with a past time"
  end
end
