class Review < ApplicationRecord
  RATES = (0..5).to_a.freeze
  belongs_to :restaurant
  validates :content, presence: true
  validates :rating, presence: true
  validates :rating, inclusion: { in: RATES }
end
