class ColumnNotNullInAppointment < ActiveRecord::Migration[7.0]
  def change
    change_column :appointments, :patient_id, :integer, null: true
  end
end
