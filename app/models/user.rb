class User < ApplicationRecord
  validates_presence_of :email
  validates_presence_of :password, require: true
  validates_uniqueness_of :email

  before_create :create_key

  has_secure_password

  private

  def create_key
    self.api_key = SecureRandom.hex
  end
end
