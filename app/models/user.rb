class User < ApplicationRecord
  validates_presence_of :email, require: true
  validates_presence_of :password, require: true

  before_create :create_key

  private
  def create_key
    self.api_key = SecureRandom.hex
  end
end
