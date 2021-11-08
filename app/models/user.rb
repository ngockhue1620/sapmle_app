class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: Settings.length.digit_50 }
  VALID_EMAIL_REGEX = Settings.email
  validates :email, presence: true, length: { maximum: Settings.length.digit_255 },
                    format: { with: VALID_EMAIL_REGEX }

  has_secure_password
  validates :password_digest, presence: true
end
