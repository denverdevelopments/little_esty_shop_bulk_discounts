class Discount < ApplicationRecord
  validates :percent, presence: true, numericality: true, :inclusion => 1..100
  validates :quantity, presence: true, numericality: true

  belongs_to :merchant
end
