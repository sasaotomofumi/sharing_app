require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#create" do
    before do 
      @user = FactoryBot.build(:user)
    end
    
    it "全ての値が存在すれば登録することができる" do
      expect(@user).to be_valid
    end

    it "nameが空では保存できない" do 
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank" )  
    end

    it "emailが空では保存できない" do 
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank" )  
    end

    it "重複したemailは保存できない" do 
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken" )
    end

    it "passwordが空では保存できない" do 
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank" )  
    end

    it "passwordが6文字以上であれば保存できること" do 
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password" )  
    end

    it "password5文字以下であれば保存できない" do 
      @user.password = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password" )  
    end

    it "passwordとpsssword_confirmationが不意一致では保存できない" do 
      @user.password = "123456"
      @user.password_confirmation = "234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password" )  
    end

    it "occupationが空では保存できない" do 
      @user.occupation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Occupation can't be blank" )  
    end

    it "position空では保存できない" do 
      @user.position = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Position can't be blank" )  
    end

  end
end
