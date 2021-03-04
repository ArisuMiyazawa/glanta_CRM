class TreatmentRecord < ApplicationRecord
  belongs_to :customer
  belongs_to :reservation

  def customer_name_kana
    customer.name_kana
  end
end
