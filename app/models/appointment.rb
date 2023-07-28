class Appointment < ApplicationRecord
  belongs_to :dentist

  attribute :date, :date
  attribute :time, :time

  validates :date, presence: true
  validates :time, presence: true
  validate :date_not_in_past
  validate :valid_date

  private

  def date_not_in_past
    if date.present? && date < Date.today
      errors.add(:date, "não pode ser marcada no passado")
    end
  end

  def valid_date
    if date.present? && time.present? && DateTime.parse("#{date} #{time}") < DateTime.now
      errors.add(:date, "horário já passou")
    end
  end
end
