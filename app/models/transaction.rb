class Transaction < ApplicationRecord
  validates :credit_card_number, presence: true, numericality: true
  # validates :credit_card_expiration_date  #is empty string '' in file
  validates :result, presence: true
  enum result: [ :failed, :success ]

  belongs_to :invoice
end
