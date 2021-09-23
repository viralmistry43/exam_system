class Topic < ApplicationRecord
  belongs_to :subject
  has_many :chapters
  has_many :questions, through: :chapters

  validates :name, presence: true, length: { maximum: 255 }
  validates :topic_number, presence: true
end
