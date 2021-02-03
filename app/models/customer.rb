class Customer < ApplicationRecord
  validates :name, presence: true, length: {maximum: 15}
  validates :name_kana, presence: true, length: {maximum: 15}
  validates :birthday, presence: true
  validates :job, presence: true
  validates :postcode, presence: true
  validates :street_address, presence: true
  validates :phone_number, presence: true

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}

  validates_acceptance_of :agreement, allow_nil: false, on: :create

end
