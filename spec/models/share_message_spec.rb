require 'rails_helper'

RSpec.describe ShareMessage, type: :model do
    describe "#create" do 
      before do 
          @share_message = FactoryBot.build(:share_message)
      end

    it "全ての値が存在すれば保存することができる" do 
      expect(@share_message).to be_valid
    end

    it "contentが空でも保存することができる" do 
      @share_message.content = nil
      expect(@share_message).to be_valid
    end

    it "imageが空でも保存することができる" do 
      @share_message.image = nil
      expect(@share_message).to be_valid
    end

    it "contentとimageが空では保存することができない" do 
      @share_message.content = nil
      @share_message.image = nil 
      @share_message.valid? 
      expect(@share_message.errors.full_messages).to include("Content can't be blank")
    end

    it 'contentが101文字以上だと保存することができない' do
        @share_message.content = '1' * 101
        @share_message.valid?
        expect(@share_message.errors.full_messages).to include('Content is too long (maximum is 100 characters)')
      end

    it "suggestion紐付いていないと保存できない" do 
      @share_message.suggestion = nil
      @share_message.valid? 
      expect(@share_message.errors.full_messages).to include("Suggestion must exist")
    end

    it "user紐付いていないと保存できない" do 
      @share_message.user = nil
      @share_message.valid? 
      expect(@share_message.errors.full_messages).to include("User must exist")
    end

  end
end
