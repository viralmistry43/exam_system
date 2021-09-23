class User < ApplicationRecord
  has_many :answers

  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 }
end
