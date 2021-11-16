class Review < ApplicationRecord
  belongs_to :booking

  validates :rating, presence: true
  validates :comment, presence: true
  validates :comment, length: { minimum: 10 }
end
