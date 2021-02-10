class GuestReservation < ApplicationRecord
  validates :name_kana, presence: true
  validates :phone_number, presence: true



end
