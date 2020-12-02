class ShareMessage < ApplicationRecord
  belongs_to :user
  belongs_to :suggestion
  has_one_attached :image

  validates :content, presence: true, length: { maximum: 100 }, unless: :was_attached?

  def was_attached?
    image.attached?
  end
end
