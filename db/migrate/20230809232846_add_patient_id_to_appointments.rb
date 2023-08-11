class AddPatientIdToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_reference :appointments, :patient, null: true, foreign_key: true, index: true
  end
end
