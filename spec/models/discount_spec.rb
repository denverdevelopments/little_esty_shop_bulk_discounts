require 'rails_helper'

RSpec.describe Discount, type: :model do
  describe 'relationships' do
    it { should belong_to(:merchant) }
  end

  describe "validations" do
    it { should validate_presence_of(:percent) }
    it { should validate_numericality_of(:percent) }
    it { should validate_presence_of(:quantity) }
    it { should validate_numericality_of(:quantity) }
  end

  before(:each) do
  end

  # describe 'instance methods' do
  #   describe 'best_day' do
  #     it 'returns the most profitable date for the merchant' do
  #       customer = Customer.create!(first_name: "Very", last_name: "Rich")
  #       merchant = Merchant.create!(name: "CCC")
  #       item = merchant.items.create!(name: "thing", description: "thingy", unit_price: 10)
  #       invoice1 = customer.invoices.create!(status: 0, created_at: "2012-03-07 12:54:10 UTC")
  #       invoice2 = customer.invoices.create!(status: 0, created_at: "2012-03-25 09:54:09 UTC")
  #       invoice3 = customer.invoices.create!(status: 0, created_at: "2011-03-25 09:54:09 UTC")
  #       invoice_item1 = InvoiceItem.create!(item: item, invoice: invoice2, quantity: 3, unit_price: 5, status: 2)
  #       invoice_item2 = InvoiceItem.create!(item: item, invoice: invoice2, quantity: 3, unit_price: 5, status: 2)
  #       invoice_item3 = InvoiceItem.create!(item: item, invoice: invoice1, quantity: 3, unit_price: 5, status: 2)
  #       invoice_item4 = InvoiceItem.create!(item: item, invoice: invoice3, quantity: 3, unit_price: 50, status: 2)
  #       transaction1 = invoice1.transactions.create!(credit_card_number: 1111222233334444, credit_card_expiration_date: '', result: 1)
  #       transaction2 = invoice2.transactions.create!(credit_card_number: 1111222233334444, credit_card_expiration_date: '', result: 1)
  #       transaction3 = invoice3.transactions.create!(credit_card_number: 1111222233334444, credit_card_expiration_date: '', result: 0)
  #
  #       expect(merchant.best_day).to eq("2012-03-25 09:54:09 UTC")
  #     end
  #   end
  # end
  #
  # describe 'class methods' do
  #   describe 'top_five_by_revenue' do
  #     it 'returns the top five merchants' do
  #       customer = Customer.create!(first_name: "Very", last_name: "Rich")
  #
  #       merchant3 = Merchant.create!(name: "CCC")
  #       item3 = merchant3.items.create!(name: "thing", description: "thingy", unit_price: 10)
  #       invoice3 = customer.invoices.create!(status: 0)
  #       transaction3 = invoice3.transactions.create!(credit_card_number: 1111222233334444, credit_card_expiration_date: '', result: 1)
  #       invoice_item7 = InvoiceItem.create!(item: item3, invoice: invoice3, quantity: 3, unit_price: 5, status: 2)
  #       invoice_item8 = InvoiceItem.create!(item: item3, invoice: invoice3, quantity: 3, unit_price: 5, status: 2)
  #       invoice_item9 = InvoiceItem.create!(item: item3, invoice: invoice3, quantity: 3, unit_price: 5, status: 2)
  #
  #       merchant5 = Merchant.create!(name: "EEE")
  #       item5 = merchant5.items.create!(name: "thing", description: "thingy", unit_price: 10)
  #       invoice5 = customer.invoices.create!(status: 0)
  #       transaction5 = invoice5.transactions.create!(credit_card_number: 1111222233334444, credit_card_expiration_date: '', result: 1)
  #       invoice_item13 = InvoiceItem.create!(item: item5, invoice: invoice5, quantity: 5, unit_price: 5, status: 2)
  #       invoice_item14 = InvoiceItem.create!(item: item5, invoice: invoice5, quantity: 5, unit_price: 5, status: 2)
  #       invoice_item15 = InvoiceItem.create!(item: item5, invoice: invoice5, quantity: 5, unit_price: 5, status: 2)
  #
  #       merchant1 = Merchant.create!(name: "AAA")
  #       item1 = merchant1.items.create!(name: "thing", description: "thingy", unit_price: 10)
  #       invoice1 = customer.invoices.create!(status: 0)
  #       transaction1 = invoice1.transactions.create!(credit_card_number: 1111222233334444, credit_card_expiration_date: '', result: 1)
  #       invoice_item1 = InvoiceItem.create!(item: item1, invoice: invoice1, quantity: 1, unit_price: 5, status: 2)
  #       invoice_item2 = InvoiceItem.create!(item: item1, invoice: invoice1, quantity: 1, unit_price: 5, status: 0)
  #       invoice_item3 = InvoiceItem.create!(item: item1, invoice: invoice1, quantity: 1, unit_price: 5, status: 1)
  #
  #       merchant6 = Merchant.create!(name: "FFF")
  #       item6 = merchant6.items.create!(name: "thing", description: "thingy", unit_price: 10)
  #       invoice6 = customer.invoices.create!(status: 0)
  #       transaction6 = invoice6.transactions.create!(credit_card_number: 1111222233334444, credit_card_expiration_date: '', result: 0)
  #       invoice_item16 = InvoiceItem.create!(item: item6, invoice: invoice6, quantity: 6, unit_price: 5, status: 2)
  #       invoice_item17 = InvoiceItem.create!(item: item6, invoice: invoice6, quantity: 6, unit_price: 5, status: 2)
  #       invoice_item18 = InvoiceItem.create!(item: item6, invoice: invoice6, quantity: 6, unit_price: 5, status: 2)
  #
  #       merchant7 = Merchant.create!(name: "GGG")
  #       item7 = merchant7.items.create!(name: "thing", description: "thingy", unit_price: 10)
  #       invoice7 = customer.invoices.create!(status: 0)
  #       transaction7 = invoice7.transactions.create!(credit_card_number: 1111222233334444, credit_card_expiration_date: '', result: 1)
  #       invoice_item19 = InvoiceItem.create!(item: item7, invoice: invoice7, quantity: 7, unit_price: 5, status: 2)
  #       invoice_item20 = InvoiceItem.create!(item: item7, invoice: invoice7, quantity: 7, unit_price: 5, status: 2)
  #       invoice_item21 = InvoiceItem.create!(item: item7, invoice: invoice7, quantity: 7, unit_price: 5, status: 2)
  #
  #       merchant4 = Merchant.create!(name: "DDD")
  #       item4 = merchant4.items.create!(name: "thing", description: "thingy", unit_price: 10)
  #       invoice4 = customer.invoices.create!(status: 0)
  #       transaction4 = invoice4.transactions.create!(credit_card_number: 1111222233334444, credit_card_expiration_date: '', result: 1)
  #       invoice_item10 = InvoiceItem.create!(item: item4, invoice: invoice4, quantity: 4, unit_price: 5, status: 2)
  #       invoice_item11 = InvoiceItem.create!(item: item4, invoice: invoice4, quantity: 4, unit_price: 5, status: 2)
  #       invoice_item12 = InvoiceItem.create!(item: item4, invoice: invoice4, quantity: 4, unit_price: 5, status: 2)
  #
  #       merchant2 = Merchant.create!(name: "BBB")
  #       item2 = merchant2.items.create!(name: "thing", description: "thingy", unit_price: 10)
  #       invoice2 = customer.invoices.create!(status: 0)
  #       transaction2 = invoice2.transactions.create!(credit_card_number: 1111222233334444, credit_card_expiration_date: '', result: 1)
  #       invoice_item4 = InvoiceItem.create!(item: item2, invoice: invoice2, quantity: 2, unit_price: 5, status: 2)
  #       invoice_item5 = InvoiceItem.create!(item: item2, invoice: invoice2, quantity: 2, unit_price: 5, status: 2)
  #       invoice_item6 = InvoiceItem.create!(item: item2, invoice: invoice2, quantity: 2, unit_price: 5, status: 2)
  #
  #       expect(Merchant.top_five_by_revenue).to eq([merchant7, merchant5, merchant4, merchant3, merchant2])
  #     end
  #   end
  # end

end
