class Booking < ApplicationRecord
  belongs_to :toilet
  belongs_to :user

  validates :date_start, presence: true
  validates :date_end, presence: true
  validates :message, presence: true
  validates :message, length: { minimum: 6 }
end
