class Dentist < ApplicationRecord
  validates :nome, presence: true, length: { maximum: 100 }
  validates :cpf, presence: true, uniqueness: true, format: { with: /\A\d{11}\z/, message: "deve ter 11 dígitos numéricos" }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :especialidade, presence: true
  validates :cro, presence: true, uniqueness: true, format: { with: /\A\d+\z/, message: "deve conter apenas dígitos numéricos" }
  validates :inicio_horario_atendimento, presence: true
  validates :termino_horario_atendimento, presence: true
  validate :horario_atendimento

  has_many :appointments

  private

  def horario_atendimento
    errors.add(:base, "O início do atendimento não pode ser depois do término") if termino_horario_atendimento? && inicio_horario_atendimento? && inicio_horario_atendimento >= termino_horario_atendimento
  end
end
