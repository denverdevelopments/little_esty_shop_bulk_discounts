class Merchant < ApplicationRecord
<<<<<<< HEAD
  validates_presence_of :name
  has_many :items
  has_many :invoice_items, through: :items
  has_many :invoices, through: :invoice_items
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  enum status: [:enabled, :disabled]

  def favorite_customers
    transactions
    .joins(invoice: :customer)
    .where('result = ?', 1)
    .select("customers.*, count('transactions.result') as top_result")
    .group('customers.id')
    .order(top_result: :desc)
    .limit(5)
  end

  def ordered_items_to_ship
    item_ids = InvoiceItem.where("status = 0 OR status = 1").order(:created_at).pluck(:item_id)
    item_ids.map do |id|
      Item.find(id)
    end
  end

  def top_5_items
     items
     .joins(invoices: :transactions)
     .where('transactions.result = 1')
     .select("items.*, sum(invoice_items.quantity * invoice_items.unit_price) as total_revenue")
     .group(:id)
     .order('total_revenue desc')
     .limit(5)
   end

  def self.top_merchants
    joins(invoices: [:invoice_items, :transactions])
    .where('result = ?', 1)
    .select('merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total_revenue')
    .group(:id)
    .order('total_revenue DESC')
=======
  validates :name, presence: true
  validates :status, presence: true

  has_many :items, dependent: :destroy
  has_many :discounts, dependent: :destroy

  enum status: [ :enabled, :disabled ]

  def ship_ready
    Merchant.joins(items: {invoice_items: :invoice})
      .where("merchants.id = ?", self.id).where("invoices.status != ?", 1).where("invoice_items.status != ?", 2)
      .order("invoices.created_at").pluck("items.name", "invoices.id", "invoices.created_at")
  end

  def top_five_customers
    Merchant.joins(items: {invoice_items: {invoice: {transactions: {invoice: :customer}}}})
        .where("merchants.id = ?", self.id).where("result = ?", 1).limit(5)
        .group('customers.id', 'customers.first_name', 'customers.last_name').order(count: :desc).count
  end

  def self.top_five_by_revenue
    Merchant.joins(items: {invoice_items: {invoice: :transactions}})
    .where("transactions.result = ?", 1)
    .group(:id)
    .select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) as total_revenue")
    .order(total_revenue: :desc)
>>>>>>> bulk
    .limit(5)
  end

  def best_day
<<<<<<< HEAD
    invoices
    .where("invoices.status = 2")
    .joins(:invoice_items)
    .select('invoices.created_at, sum(invoice_items.unit_price * invoice_items.quantity) as revenue')
    .group("invoices.created_at")
    .order("revenue desc", "created_at desc")
    .first
    .created_at
    .to_date
=======
    self.items
    .joins(invoice_items: {invoice: :transactions})
    .where("transactions.result = ?", 1)
    .group("invoices.id")
    .select("invoices.*, sum(invoice_items.quantity * invoice_items.unit_price) as total_revenue")
    .order(total_revenue: :desc)
    .first
    .created_at
  end

  def unique_invoices
    Invoice.joins(items: :merchant).where('merchants.id = ?', self.id).group(:id)
>>>>>>> bulk
  end
end
