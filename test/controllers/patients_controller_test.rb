require_relative  "../test_helper"

class PatientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patient = Patient.new(
      full_name: "Johnny Bravo",
      email_address: "johnny_bravo@email.com",
      cpf: "12345678900",
      phone_number: "40028922"
    )
  end

  test "should get index" do
    get patients_url
    assert_response :success
  end

  test "should get new" do
    get new_patient_url
    assert_response :success
  end

  test "should create patient" do
    assert_difference("Patient.count") do
      post patients_url, params: {
        patient: { cpf: @patient.cpf,
                   email_address: @patient.email_address,
                   full_name: @patient.full_name,
                   phone_number: @patient.phone_number
        }
      }
    end

    assert_redirected_to patient_url(Patient.last)
  end

  #test "should show patient" do
  #  get patient_url(@patient)
  #  assert_response :success
  #end

  #test "should get edit" do
  #  get edit_patient_url(@patient)
  #  assert_response :success
  #end

  #test "should update patient" do
  #  patch patient_url(@patient), params: { patient: { cpf: @patient.cpf, email_address: @patient.email_address, full_name: @patient.full_name, phone_number: @patient.phone_number } }
  #  assert_redirected_to patient_url(@patient)
  #end

  #test "should destroy patient" do
  #    assert_difference("Patient.count", -1) do
  #    delete patient_url(@patient)
  #  end

  #  assert_redirected_to patients_url
  #end
end
