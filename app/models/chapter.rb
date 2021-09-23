class Chapter < ApplicationRecord
  belongs_to :topic
  has_many :questions

  validates :name, presence: true, length: { maximum: 255 }
  validates :chapter_number, presence: true
end
