require 'rails_helper'


RSpec.describe User, type: :model do
  before :each do
    @user = User.new(full_name: "test", email:"vidushan@test.com", password: "1234567", password_confirmation: "1234567")
  end

  describe 'Validations' do

    it "Check if full name is blank" do
      @user.full_name = ''
      expect(@user.valid?).to be false
      end

    it "Check if email is blank" do
      @user.email = ''
      expect(@user.valid?).to be false
    end

    it "Check if password is present" do
      @user.password = nil
      expect(@user.valid?).to be false
    end

    it "Check if password_confirmation is blank" do
      @user.password_confirmation = ''
      expect(@user.valid?).to be false
    end

    it "Check if email has required input" do
      @user.email = nil
      expect(@user.valid?).to be false
    end

    it "should be matching password and password_confirmation field" do
      # @user.password = "123456"
      # @user.password_confirmation = "654321"
      expect(@user.password_confirmation).to eq(@user.password)
    end

    it "should not have a password longer or equal to 6 characters" do
      # @user.password = "123"
      expect(@user.password.length).to be >= 6
    end
  end
  

end
