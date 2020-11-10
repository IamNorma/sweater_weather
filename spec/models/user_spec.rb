require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation) }
  end

  describe 'instance methods' do
    it '.set_api_key' do
      user = User.create!(email: 'example@email.com', password: '123pass', password_confirmation: '123pass')

      expect(user.api_key).to be_a(String)
      expect(user.api_key.size).to eq(28)
    end
  end
end
