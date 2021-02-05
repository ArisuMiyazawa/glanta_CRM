class GuestReservation < ApplicationRecord
  validates :name_kana, presence: true
  validates :phone_number, presence: true
  validates :reservation_date, presence: true
  validates :reservation_time, presence: true
  validates :ntroducer_id, presence: true

  belongs_to :reservation_list
  belongs_to :customer
end
