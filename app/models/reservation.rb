class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  with_options presence: true do
    validates :start_date
    validates :end_date
    validates :person_num
  end

  validate :start_before_today
  validate :end_before_start

  def start_before_today
    return if start_date.blank?
    errors.add("過去の日付は無効です") if start_date < Date.today
  end

  def end_before_start
    return if end_date.blank?
    errors.add(:end_date, "は開始日より後にしてください") if end_date < start_date
  end
end
