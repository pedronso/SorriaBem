json.extract! patient, :id, :full_name, :email_address, :cpf, :phone_number, :created_at, :updated_at
json.url patient_url(patient, format: :json)
