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

  #FEATURE 1

  test "should return no appointments for a future date with no appointments" do
    search_date = Date.tomorrow + 26

    @appointments = Appointment.where(date: search_date)

    #nao ha consultas para daqui 27 dias, entao nao havera nenhuma consulta retornada
    assert_empty @appointments, "Should return no appointments for a future date with no appointments"
  end

  test "should return appointments for a valid date range" do
    appointment1 = Appointment.create(date: Date.tomorrow, time: "14:30:00", dentist: @dentist)
    appointment2 = Appointment.create(date: Date.tomorrow + 1, time: "10:00:00", dentist: @dentist)
    appointment3 = Appointment.create(date: Date.tomorrow + 2, time: "16:00:00", dentist: @dentist)

    start_date = Date.tomorrow
    end_date = Date.tomorrow + 2

    #chamando o metodo que realiza a busca de consultas por periodo
    @appointments = Appointment.where(date: start_date..end_date)

    #verificando a quantidade e se as consultas estão no periodo devido
    assert_equal 3, @appointments.count, "Should return all appointments within the date range"
    assert @appointments.include?(appointment1), "Appointment should be within the date range"
    assert @appointments.include?(appointment2), "Appointment should be within the date range"
    assert @appointments.include?(appointment3), "Appointment should be within the date range"
  end

  test "should return an error for an invalid date range" do
    appointment = Appointment.create(date: Date.yesterday, time: "14:30:00", dentist: @dentist)

    #definindo um periodo invalido para busca, do dia de amanhã até o de 3 dias antes
    start_date = Date.tomorrow
    end_date = Date.yesterday - 2

    @appointments = Appointment.where(date: start_date..end_date)

    assert_equal 0, @appointments.count, "Should return no appointments for an invalid date range"
  end

  test "should return no appointments for a reversed date range" do
    start_date = Date.tomorrow + 2
    end_date = Date.tomorrow

    @appointments = Appointment.where(date: start_date..end_date)

    #verificando que nao retorna consultas, estas que estejam em um periodo de tempo em que o tempo final seja menor que o tempo inicial
    assert_equal 0, @appointments.count, "Should return no appointments for a reversed date range"
  end

  test "should return appointments within the specified date range" do
    appointment1 = Appointment.create(date: Date.tomorrow, time: "14:00:00", dentist: @dentist)
    appointment2 = Appointment.create(date: Date.tomorrow + 1, time: "10:30:00", dentist: @dentist)
    appointment3 = Appointment.create(date: Date.tomorrow + 2, time: "16:45:00", dentist: @dentist)

    start_date = Date.tomorrow
    end_date = Date.tomorrow + 1

    @appointments = Appointment.where(date: start_date..end_date)

    #verificando se o teste retorna as funcoes corretas dentro do intervalo de tempo
    assert_equal [appointment1, appointment2], @appointments.to_a, "Should return appointments within the specified date range"
  end




  # FEATURE 2

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
