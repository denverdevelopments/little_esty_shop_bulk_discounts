class Customer < ApplicationRecord
<<<<<<< HEAD
  validates_presence_of :first_name,
                        :last_name
  
  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices

  def self.top_customers
    joins(:transactions)
      .where('result = ?', 1)
      .group(:id)
      .select("customers.*, count('transactions.result') as top_result")
      .order(top_result: :desc)
      .limit(5)
  end

  def number_of_transactions
    transactions
      .where('result = ?', 1)
      .count
=======
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :invoices, dependent: :destroy

  def self.top_five
    joins(invoices: :transactions)
    .group(:id)
    .where("transactions.result = ?", 1)
    .select("customers.*, count(transactions.id) as num_transactions")
    .order(num_transactions: :desc)
    .limit(5)
>>>>>>> bulk
  end
end
