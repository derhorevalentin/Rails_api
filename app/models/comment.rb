class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  validates :commenter, presence: true
  validates :body, presence: true
end
