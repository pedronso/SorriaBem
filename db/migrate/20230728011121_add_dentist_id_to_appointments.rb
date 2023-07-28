class AddDentistIdToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_reference :appointments, :dentist, null: false, foreign_key: true
  end
end
