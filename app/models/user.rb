class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: Settings.length.digit_50 }
  VALID_EMAIL_REGEX = Settings.email
  validates :email, presence: true, length: { maximum: Settings.length.digit_255 },
                    format: { with: VALID_EMAIL_REGEX }

  has_secure_password
  validates :password_digest, presence: true

  class <<self
    def digest(string)
     cost = if ActiveModel::SecurePassword.min_cost
              BCrypt::Engine::MIN_COST
             else
              BCrypt::Engine.cost
             end
      BCrypt::Password.create string, cost: cost
    end
  end
end
