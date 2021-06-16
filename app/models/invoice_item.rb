class InvoiceItem < ApplicationRecord
  validates :quantity, presence: true, numericality: true
  validates :unit_price, presence: true, numericality: true
  validates :status, presence: true
  enum status: [ :packaged, :pending, :shipped ]

  belongs_to :item
  belongs_to :invoice

  has_one :merchant, through: :item
  has_many :discounts, through: :merchant

 def discount_used
   discounts.where("quantity <= ?", self.quantity)
            .order(:discount).last
 end

 def discounted_revenue
  if discount_used.present?
     (1 - discount_used.percent) * quantity * unit_price
  else
    quantity * unit_price
  end
end

end
