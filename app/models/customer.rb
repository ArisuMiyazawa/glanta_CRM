class Customer < ApplicationRecord
  validates :name, presence: true
  validates :name_kana, presence: true
  validates :birthday, presence: true
  validates :job, presence: true
  validates :postcode, presence: true
  validates :street_address, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true
  validates_acceptance_of :agreement, allow_nil: false, on: :create
end
