require "rails_helper"

RSpec.describe InvoiceItem do
  describe "relationships" do
    it {should belong_to :item}
    it {should belong_to :invoice}
  end

  describe 'instance methods' do
    describe 'best_discount' do
      it 'finds all applicable bulk discounts, returns greatest discount' do
        merchant = Merchant.create!(name: "mel")
        discount1 = merchant.discounts.create!(quantity: 10, percent: 10)
        discount2 = merchant.discounts.create!(quantity: 20, percent: 20)
        discount3 = merchant.discounts.create!(quantity: 30, percent: 30)
        discount4 = merchant.discounts.create!(quantity: 40, percent: 40)
        discount5 = merchant.discounts.create!(quantity: 15, percent: 10)
        customer = Customer.create!(first_name: "Abe", last_name: "Oldman")

        item1 = merchant.items.create!(name: "thing", description: "thingy", unit_price: 10)
        invoice1 = customer.invoices.create!(status: 0)

        invoice_item1 = InvoiceItem.create!(item: item1, invoice: invoice1, quantity: 20, unit_price: 5, status: 2) #50
        invoice_item2 = InvoiceItem.create!(item: item1, invoice: invoice1, quantity: 2, unit_price: 5, status: 0) #10
        invoice_item3 = InvoiceItem.create!(item: item1, invoice: invoice1, quantity: 3, unit_price: 5, status: 1) #15
        invoice_item4 = InvoiceItem.create!(item: item1, invoice: invoice1, quantity: 4, unit_price: 5, status: 2) #20

        expect(invoice_item1.best_discount).to eq(discount2)
      end
    end

    describe 'revenue' do
      it 'returns revenue after discount is applied' do
        merchant = Merchant.create!(name: "mel")
        discount1 = merchant.discounts.create!(quantity: 10, percent: 10)
        discount2 = merchant.discounts.create!(quantity: 20, percent: 20)
        discount3 = merchant.discounts.create!(quantity: 30, percent: 30)
        discount4 = merchant.discounts.create!(quantity: 40, percent: 40)
        discount5 = merchant.discounts.create!(quantity: 15, percent: 10)
        customer = Customer.create!(first_name: "Abe", last_name: "Oldman")

        item1 = merchant.items.create!(name: "thing", description: "thingy", unit_price: 10)
        invoice1 = customer.invoices.create!(status: 0)

        invoice_item1 = InvoiceItem.create!(item: item1, invoice: invoice1, quantity: 20, unit_price: 5, status: 2) #100
        invoice_item2 = InvoiceItem.create!(item: item1, invoice: invoice1, quantity: 2, unit_price: 5, status: 0) #10
        invoice_item3 = InvoiceItem.create!(item: item1, invoice: invoice1, quantity: 3, unit_price: 5, status: 1) #15
        invoice_item4 = InvoiceItem.create!(item: item1, invoice: invoice1, quantity: 4, unit_price: 5, status: 2) #20

        expect(invoice_item1.revenue).to eq(80)
      end

      it 'returns full price if no discount is applied' do
        merchant = Merchant.create!(name: "mel")
        merchant.discounts.create!(quantity: 30, percent: 30)
        merchant.discounts.create!(quantity: 40, percent: 40)
        customer = Customer.create!(first_name: "Abe", last_name: "Oldman")

        item1 = merchant.items.create!(name: "thing", description: "thingy", unit_price: 10)
        invoice1 = customer.invoices.create!(status: 0)

        invoice_item1 = InvoiceItem.create!(item: item1, invoice: invoice1, quantity: 20, unit_price: 5, status: 2) #100
        invoice_item2 = InvoiceItem.create!(item: item1, invoice: invoice1, quantity: 2, unit_price: 5, status: 0) #10
        invoice_item3 = InvoiceItem.create!(item: item1, invoice: invoice1, quantity: 3, unit_price: 5, status: 1) #15
        invoice_item4 = InvoiceItem.create!(item: item1, invoice: invoice1, quantity: 4, unit_price: 5, status: 2) #20

        expect(invoice_item1.revenue).to eq(100)
      end
    end
  end
end
