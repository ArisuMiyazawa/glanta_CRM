class Reservation < ApplicationRecord
  validates :reservation_date, presence: true
  validates :reservation_time, presence: true
  belongs_to :customer
  has_one :treatment_record, dependent: :destroy
  validate :cannot_reserve_that_time
  validate :cannot_reserve_that_day

  def cannot_reserve_that_time
    unless reservation_time == nil
    reservations = Reservation.where(reservation_date: reservation_date)
                              .where("reservation_time BETWEEN ? AND ?", reservation_time.ago(30.minutes), reservation_time.since(30.minutes))
    errors.add(:reservation_time, "の前後30分以内に他の予約があるため選択できません") if reservations.length > 0
    end
  end

  def cannot_reserve_that_day
    unless reservation_date == nil
      errors.add(:reservation_date, "は過去日を選択できません")if reservation_date < Date.today
    end
  end

end
