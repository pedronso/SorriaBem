class Appointment < ApplicationRecord
  belongs_to :dentist
  belongs_to :patient

  validates :date, presence: true
  validates :time, presence: true

  validate :date_and_time_valid, :no_conflicting_appointment

  private

  def date_and_time_valid
    validate_date_not_in_past
    validate_time_not_passed
  end

  def validate_date_not_in_past
    errors.add(:date, "não pode ser marcada no passado") if date && date < Time.zone.today
  end

  def validate_time_not_passed
    appointment_datetime = DateTime.new(date.year, date.month, date.day, time.hour, time.min)
    errors.add(:date, "horário já passou") if date && time && appointment_datetime < Time.zone.now
  end

  def no_conflicting_appointment
    if dentist&.appointments.exists?(date: date, time: time)
      errors.add(:base, "horário já ocupado por outra consulta")
    end
  end
end
