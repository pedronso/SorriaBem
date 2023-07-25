json.extract! dentist, :id, :nome, :cpf, :email, :especialidade, :cro, :inicio_horario_atendimento, :termino_horario_atendimento, :created_at, :updated_at
json.url dentist_url(dentist, format: :json)
