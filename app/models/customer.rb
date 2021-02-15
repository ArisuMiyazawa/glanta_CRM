class Customer < ApplicationRecord
  validates :name, length: {maximum: 15}
  validates :name_kana, presence: true, length: {maximum: 15}
  validates :phone_number, presence: true

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
  validates :email, format: {with: VALID_EMAIL_REGEX}, allow_nil: true

  validates_acceptance_of :consent, allow_nil: false, on: :create

end
