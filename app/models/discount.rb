class Discount < ApplicationRecord
  validates :percent, presence: true, numericality: true
  validates :quantity, presence: true, numericality: true, :inclusion => 1..100  ##inclusion: {in: 0..100}

  belongs_to :merchant
end
