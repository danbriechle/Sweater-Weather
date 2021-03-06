require 'rails_helper'

describe User do
  describe 'validations' do
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password)}
    it {should validate_uniqueness_of(:email)}
    it {should have_many(:favorites)}
  end

  describe 'class methods' do
    it 'create_key' do
    user = User.create(email: "whatever@whatever.com", password: 'secure_password')

    expect(user.api_key.class).to eq(String)
    end
  end
end
