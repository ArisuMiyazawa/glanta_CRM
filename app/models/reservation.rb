class Reservation < ApplicationRecord
  validates :reservation_date, presence: true
  validates :reservation_time, presence: true
  belongs_to :customer
  has_one :treatment_record

  def self.search(search)
    search ? where('name_kana LIKE ?', "%#{search}%") : all
  end

  validate :date_before_start
  validates :start_time, uniqueness: { message: 'は他のユーザーが予約しています' }

  def start_time
    self.reservation_time
  end

  def date_before_start
    errors.add(:start_time, "は過去の日付を選択できません") if start_time < Date.today
  end
end
