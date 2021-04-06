class Reservation < ApplicationRecord
  validates :reservation_date, presence: true
  validates :reservation_time, presence: true
  belongs_to :customer
  has_one :treatment_record, dependent: :destroy
  validate :cannot_reserve_that_time
end

  def cannot_reserve_that_time
    check = Reservation.where("reservation_time BETWEEN ? AND ?", reservation_time.ago(30.minutes), reservation_time.since(30.minutes))
    if check.length > 0
      errors.add(:date, "前後30分以内にご予約があるため選択できません")
    else
      return true
    end
   end
