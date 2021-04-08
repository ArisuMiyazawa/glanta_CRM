class User < ApplicationRecord
  validates :name, presence: true

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
  validates :email, format: {with: VALID_EMAIL_REGEX, message: :invalid_email}, presence: true, uniqueness: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]{8,32}+\z/
  validates :password, length: {minimum: 8, maximum: 32}, format: {with: VALID_PASSWORD_REGEX, message: :invalid_password}

  validates :password_confirmation, presence: true

  has_secure_password

end
