class TreatmentRecord < ApplicationRecord
  belongs_to :customer
  belongs_to :reservation

  def customer_name_kana
    customer.name_kana
  end

  def reservation_reservation_date
    reservation.reservation_date
  end
end
