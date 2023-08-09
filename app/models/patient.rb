class Patient < ApplicationRecord
  has_one :appointment
  validates :full_name, presence: true
  validates :email_address, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :cpf, presence: true, uniqueness: true
  validates :phone_number, presence: true

end
