class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :travel

  validates :comment_body, presence: true
end
