class Customer < ApplicationRecord
  validates :name_kana, presence: true
  validates :phone_number, presence: true
  validates :introducer_name, presence: true

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
  validates :email, format: {with: VALID_EMAIL_REGEX}, presence: true, unless: :guest_account?
  validates_acceptance_of :consent, allow_nil: false, unless: :guest_account?

  has_many :reservations
  accepts_nested_attributes_for :reservations
  has_many :treatment_records

  attr_accessor :guest_account
  alias_method :guest_account?, :guest_account
end
