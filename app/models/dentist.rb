class Dentist < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments

  validates :nome, :especialidade, presence: true, format: { with: /\A[^0-9]+\z/, message: "não pode conter apenas números" }
  validates :cpf, :email, presence: true, uniqueness: true
  validates :cpf, format: { with: /\A\d{11}\z/, message: "deve ter 11 dígitos numéricos" }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :cro, presence: true, uniqueness: true, numericality: { only_integer: true, message: "deve conter apenas dígitos numéricos" }
  validates :inicio_horario_atendimento, :termino_horario_atendimento, presence: true
  validate :horario_atendimento_valid

  private

  def horario_atendimento_valid
    if termino_horario_atendimento? && inicio_horario_atendimento? && inicio_horario_atendimento >= termino_horario_atendimento
      errors.add(:base, "O início do atendimento não pode ser depois do término")
    end
  end
end
