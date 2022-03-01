class User < ApplicationRecord
  has_many :articles
  has_secure_password
  validates :username, presence: true, length: { minimum: 4 }
  #validates :password, presence: true, length: { minimum: 6 }
end
