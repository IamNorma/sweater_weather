require 'securerandom'

class User < ApplicationRecord
  before_create :set_api_key

  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  has_secure_password

  def set_api_key
    self.api_key = SecureRandom.base58(28)
  end
end
