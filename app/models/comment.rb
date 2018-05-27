class Comment < ApplicationRecord
  belongs_to :micropost
  belongs_to :user
  validates :micropost_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 300 }
end
