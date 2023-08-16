ActiveRecord::Base.update_all(
  "patient_id = NULL",
  "patient_id IS NULL"
)