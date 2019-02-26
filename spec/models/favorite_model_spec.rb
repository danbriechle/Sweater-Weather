require 'rails_helper'

describe Favorite do
  describe 'validations' do
    it {should validate_presence_of(:location)}
  end

  describe 'relationships' do
    it {should belong_to(:user)}
  end

end
