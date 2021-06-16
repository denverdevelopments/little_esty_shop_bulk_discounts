class InvoiceItem < ApplicationRecord
  validates :quantity, presence: true, numericality: true
  validates :unit_price, presence: true, numericality: true
  validates :status, presence: true
  enum status: [ :packaged, :pending, :shipped ]

  belongs_to :item
  belongs_to :invoice

  has_one :merchant, through: :item
  has_many :discounts, through: :merchant

  def best_discount
    discounts.order(:percent)
    .where("quantity <= ?", self.quantity)
    .last
  end

  def revenue
    if best_discount.present?
      quantity * unit_price * (100 - best_discount.percent) / 100
    else
      quantity * unit_price
    end
  end
end
