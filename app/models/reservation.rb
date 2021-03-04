class Reservation < ApplicationRecord
  validates :reservation_date, presence: true
  validates :reservation_time, presence: true
  belongs_to :customer
  has_one :treatment_record

  def self.search(search)
    search ? where('name_kana LIKE ?', "%#{search}%") : all
  end
end
