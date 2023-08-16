def change
  change_column(:appointments, :patient_id, :integer, {:null=>false}, where: "patient_id IS NOT NULL")
end
