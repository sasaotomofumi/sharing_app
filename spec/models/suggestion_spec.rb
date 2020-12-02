require 'rails_helper'

  RSpec.describe Suggestion, type: :model do
    describe '#create' do
      before do 
          @suggestion = FactoryBot.build(:suggestion)
      end

    it "全ての値が存在すれば保存することができる" do 
        expect(@suggestion).to be_valid 
    end

    it "contentが空では保存できない" do 
        @suggestion.content = nil
        @suggestion.valid?
        expect(@suggestion.errors.full_messages).to include("Content can't be blank") 
    end

    it "purposeが空では保存できない" do 
        @suggestion.purpose = nil
        @suggestion.valid?
        expect(@suggestion.errors.full_messages).to include("Purpose can't be blank") 
    end

    it "detailが空では保存できない" do 
        @suggestion.detail = nil
        @suggestion.valid?
        expect(@suggestion.errors.full_messages).to include("Detail can't be blank") 
    end

    it "deadlineが空では保存できない" do 
        @suggestion.deadline = nil
        @suggestion.valid?
        expect(@suggestion.errors.full_messages).to include("Deadline can't be blank") 
    end

  end
end
