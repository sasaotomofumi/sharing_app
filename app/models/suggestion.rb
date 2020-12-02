class Suggestion < ApplicationRecord
  belongs_to :user
  has_many :share_messages, dependent: :destroy

  with_options presence: true do
    validates :content
    validates :purpose
    validates :detail
    validates :deadline
  end
end
