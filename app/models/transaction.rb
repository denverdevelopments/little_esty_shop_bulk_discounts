class Transaction < ApplicationRecord
<<<<<<< HEAD
  validates_presence_of :invoice_id,
                        :credit_card_number,
                        :result
  enum result: [:failed, :success]
=======
  validates :credit_card_number, presence: true, numericality: true
  # validates :credit_card_expiration_date  #is empty string '' in file
  validates :result, presence: true
  enum result: [ :failed, :success ]
>>>>>>> bulk

  belongs_to :invoice
end
