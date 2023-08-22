class Appointment < ApplicationRecord
  belongs_to :dentist
  belongs_to :patient

  attribute :date, :date
  attribute :time, :time

  before_validation :validate_date_not_in_past, :validate_valid_date

  validates :date, presence: true
  validates :time, presence: true

  validate :appointment_not_conflicting

  private

  def validate_date_not_in_past
    return unless date.present?

    if date < Time.zone.today
      errors.add(:date, "não pode ser marcada no passado")
    end
  end

  def validate_valid_date
    return unless date.present? && time.present?

    if DateTime.parse("#{date} #{time}") < Time.zone.now
      errors.add(:date, "horário já passou")
    end
  end

  def appointment_not_conflicting
    if dentist && dentist.appointments.where(date: date, time: time).exists?
      errors.add(:base, "horário já ocupado por outra consulta")
    end
  end
end
