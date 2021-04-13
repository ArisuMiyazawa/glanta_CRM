class Customer < ApplicationRecord

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  VALID_PHONE_NUMBER_REGEX = /\A\d{10,11}\z/
  VALID_JAP_ZENKAKU_EN_HANKAKU_REGEX = /\A[a-zA-Z]+\z|\A[ぁ-んァ-ン一-龥]/
  VALID_POSTCODE_REGEX = /\A\d{7}\z/
  VALID_STREET_ADDRESS_REGEX = /\A[a-zA-Z0-9]+\z|\A[ぁ-んァ-ン一-龥]/

  before_validation :strip_email
  validates :name_kana, format: {with: VALID_KANA_REGEX, message: :invalid_kana}, presence: true
  validates :phone_number, format: {with: VALID_PHONE_NUMBER_REGEX, message: :invalid_phone_number}, presence: true
  validates :introducer_name, format: {with: VALID_KANA_REGEX, message: :invalid_kana}, presence: true
  validates :name, format: {with: VALID_JAP_ZENKAKU_EN_HANKAKU_REGEX , message: :invalid_name_job}, presence: true, unless: :guest_account?
  validates :job, format: {with: VALID_JAP_ZENKAKU_EN_HANKAKU_REGEX, message: :invalid_name_job}, presence: true, unless: :guest_account?
  validates :postcode, format: {with: VALID_POSTCODE_REGEX, message: :invalid_postcode}, presence: true, unless: :guest_account?
  validates :street_address, format: {with: VALID_STREET_ADDRESS_REGEX, message: :invalid_street_address}, presence: true, unless: :guest_account?
  validates :email, format: {with: VALID_EMAIL_REGEX, message: :invalid_email}, uniqueness: true, presence: true, unless: :guest_account?
  validates_acceptance_of :consent, allow_nil: false, unless: :guest_account?


  has_many :reservations, dependent: :destroy
  accepts_nested_attributes_for :reservations

  has_many :treatment_records, dependent: :destroy

  attr_accessor :guest_account
  alias_method :guest_account?, :guest_account

  def latest_reservations_id
   reservations.last.id
  end

  def self.search(search)
   if search
     @customer = Customer.where('name_kana LIKE ?', "%#{search}%")
   else
     @customer = Customer.all
   end
 end

  def strip_email
    self.email = email.to_s.strip
  end

end
