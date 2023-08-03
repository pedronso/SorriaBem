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

  test "should not allow conflicting appointments" do
    existing_appointment = Appointment.create(date: Date.tomorrow, time: "14:30:00", dentist: @dentist)
    conflicting_appointment = Appointment.create(date: Date.tomorrow, time: "14:30:00", dentist: @dentist)

    existing_appointment.save
    assert_not conflicting_appointment.save, "Saved a conflicting appointment"
  end

  test "should be able to update appointment time" do
    @appointment.save

    updated_time = Time.new(2000, 1, 1, 15, 0, 0)

    assert @appointment.update(time: updated_time), "Failed to update appointment time"
    assert_equal updated_time, @appointment.time, "Appointment time not updated"
  end

  test "should destroy appointment correctly" do
    assert @appointment.save, "Failed to save the valid appointment"
    assert_not_nil @appointment.id, "Appointment ID should not be nil after save"

    assert_difference 'Appointment.count', -1 do
      @appointment.destroy
    end
  end

end
