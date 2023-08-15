require "test_helper"

class PatientTest < ActiveSupport::TestCase
  test "should save a valid patient" do
    patient = Patient.new(
      full_name: "Johnny Bravo",
      email_address: "johnny_bravo@email.com",
      cpf: "12345678900",
      phone_number: "40028922"
    )
    assert patient.save, "Failed to save a valid patient"
  end

  test "should not save patient without full name" do
    patient = Patient.new(
      email_address: "email@email.com",
      cpf: "12312312312",
      phone_number: "40028922"
    )
    assert_not patient.save, "Saved patient without full name"
  end

  test "should not save patient with duplicate email address" do
    existing_patient = patients(:one)  # Assuming you have fixtures or factories set up
    patient = Patient.new(
      full_name: "Zezé de Camargos",
      email_address: existing_patient.email_address,
      cpf: "11111111111",
      phone_number: "40028922"
    )
    assert_not patient.save, "Saved patient with duplicate email address"
  end
end
