require 'rails_helper'

<<<<<<< HEAD
describe Merchant do
  describe "validations" do
    it { should validate_presence_of :name }
  end
  describe "relationships" do
    it { should have_many :items }
    it { should have_many(:invoice_items).through(:items) }
    it {should have_many(:invoices).through(:invoice_items)}
    it { should have_many(:customers).through(:invoices) }
    it { should have_many(:transactions).through(:invoices) }

  end

  describe "instance methods" do
    before :each do
      @merchant1 = Merchant.create!(name: 'Hair Care')
      @merchant2 = Merchant.create!(name: 'Jewelry')

      @item_1 = Item.create!(name: "Shampoo", description: "This washes your hair", unit_price: 10, merchant_id: @merchant1.id, status: 1)
      @item_2 = Item.create!(name: "Conditioner", description: "This makes your hair shiny", unit_price: 8, merchant_id: @merchant1.id)
      @item_3 = Item.create!(name: "Brush", description: "This takes out tangles", unit_price: 5, merchant_id: @merchant1.id)
      @item_4 = Item.create!(name: "Hair tie", description: "This holds up your hair", unit_price: 1, merchant_id: @merchant1.id)
      @item_7 = Item.create!(name: "Scrunchie", description: "This holds up your hair but is bigger", unit_price: 3, merchant_id: @merchant1.id)
      @item_8 = Item.create!(name: "Butterfly Clip", description: "This holds up your hair but in a clip", unit_price: 5, merchant_id: @merchant1.id)

      @item_5 = Item.create!(name: "Bracelet", description: "Wrist bling", unit_price: 200, merchant_id: @merchant2.id)
      @item_6 = Item.create!(name: "Necklace", description: "Neck bling", unit_price: 300, merchant_id: @merchant2.id)

      @customer_1 = Customer.create!(first_name: 'Joey', last_name: 'Smith')
      @customer_2 = Customer.create!(first_name: 'Cecilia', last_name: 'Jones')
      @customer_3 = Customer.create!(first_name: 'Mariah', last_name: 'Carrey')
      @customer_4 = Customer.create!(first_name: 'Leigh Ann', last_name: 'Bron')
      @customer_5 = Customer.create!(first_name: 'Sylvester', last_name: 'Nader')
      @customer_6 = Customer.create!(first_name: 'Herber', last_name: 'Coon')

      @invoice_1 = Invoice.create!(customer_id: @customer_1.id, status: 2)
      @invoice_2 = Invoice.create!(customer_id: @customer_1.id, status: 2)
      @invoice_3 = Invoice.create!(customer_id: @customer_2.id, status: 2)
      @invoice_4 = Invoice.create!(customer_id: @customer_3.id, status: 2)
      @invoice_5 = Invoice.create!(customer_id: @customer_4.id, status: 2)
      @invoice_6 = Invoice.create!(customer_id: @customer_5.id, status: 2)
      @invoice_7 = Invoice.create!(customer_id: @customer_6.id, status: 1)

      @ii_1 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_1.id, quantity: 9, unit_price: 10, status: 0, created_at: "2012-03-27 14:54:09")
      @ii_2 = InvoiceItem.create!(invoice_id: @invoice_2.id, item_id: @item_1.id, quantity: 1, unit_price: 10, status: 0, created_at: "2012-03-29 14:54:09")
      @ii_3 = InvoiceItem.create!(invoice_id: @invoice_3.id, item_id: @item_2.id, quantity: 2, unit_price: 8, status: 2, created_at: "2012-03-28 14:54:09")
      @ii_4 = InvoiceItem.create!(invoice_id: @invoice_4.id, item_id: @item_3.id, quantity: 3, unit_price: 5, status: 1, created_at: "2012-03-30 14:54:09")
      @ii_6 = InvoiceItem.create!(invoice_id: @invoice_5.id, item_id: @item_4.id, quantity: 1, unit_price: 1, status: 1, created_at: "2012-04-01 14:54:09")
      @ii_7 = InvoiceItem.create!(invoice_id: @invoice_6.id, item_id: @item_7.id, quantity: 1, unit_price: 3, status: 1, created_at: "2012-04-02 14:54:09")
      @ii_8 = InvoiceItem.create!(invoice_id: @invoice_7.id, item_id: @item_8.id, quantity: 1, unit_price: 5, status: 1, created_at: "2012-04-03 14:54:09")
      @ii_9 = InvoiceItem.create!(invoice_id: @invoice_7.id, item_id: @item_4.id, quantity: 1, unit_price: 1, status: 1, created_at: "2012-04-04 14:54:09")

      @transaction1 = Transaction.create!(credit_card_number: 203942, result: 1, invoice_id: @invoice_1.id)
      @transaction2 = Transaction.create!(credit_card_number: 230948, result: 1, invoice_id: @invoice_2.id)
      @transaction3 = Transaction.create!(credit_card_number: 234092, result: 1, invoice_id: @invoice_3.id)
      @transaction4 = Transaction.create!(credit_card_number: 230429, result: 1, invoice_id: @invoice_4.id)
      @transaction5 = Transaction.create!(credit_card_number: 102938, result: 1, invoice_id: @invoice_5.id)
      @transaction6 = Transaction.create!(credit_card_number: 879799, result: 0, invoice_id: @invoice_6.id)
      @transaction7 = Transaction.create!(credit_card_number: 203942, result: 1, invoice_id: @invoice_7.id)

    end
    it "can list items ready to ship" do
      expect(@merchant1.ordered_items_to_ship).to eq([@item_1, @item_1, @item_3, @item_4, @item_7, @item_8, @item_4])
    end
    it "shows a list of favorite customers" do
      expected = @merchant1.favorite_customers.map do |customer|
        customer[:first_name]
      end
      expect(expected).to eq([@customer_1.first_name, @customer_2.first_name, @customer_3.first_name, @customer_4.first_name, @customer_6.first_name])
    end

    it "top_5_items" do
      expect(@merchant1.top_5_items).to eq([@item_1, @item_2, @item_3, @item_8, @item_4])
    end
  end
=======
RSpec.describe Merchant, type: :model do
  describe 'relationships' do
    it { should have_many(:items) }
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :status}
  end

  before(:each) do
  end

  describe 'instance methods' do
    describe 'best_day' do
      it 'returns the most profitable date for the merchant' do
        customer = Customer.create!(first_name: "Very", last_name: "Rich")
        merchant = Merchant.create!(name: "CCC")
        item = merchant.items.create!(name: "thing", description: "thingy", unit_price: 10)
        invoice1 = customer.invoices.create!(status: 0, created_at: "2012-03-07 12:54:10 UTC")
        invoice2 = customer.invoices.create!(status: 0, created_at: "2012-03-25 09:54:09 UTC")
        invoice3 = customer.invoices.create!(status: 0, created_at: "2011-03-25 09:54:09 UTC")
        invoice_item1 = InvoiceItem.create!(item: item, invoice: invoice2, quantity: 3, unit_price: 5, status: 2)
        invoice_item2 = InvoiceItem.create!(item: item, invoice: invoice2, quantity: 3, unit_price: 5, status: 2)
        invoice_item3 = InvoiceItem.create!(item: item, invoice: invoice1, quantity: 3, unit_price: 5, status: 2)
        invoice_item4 = InvoiceItem.create!(item: item, invoice: invoice3, quantity: 3, unit_price: 50, status: 2)
        transaction1 = invoice1.transactions.create!(credit_card_number: 1111222233334444, credit_card_expiration_date: '', result: 1)
        transaction2 = invoice2.transactions.create!(credit_card_number: 1111222233334444, credit_card_expiration_date: '', result: 1)
        transaction3 = invoice3.transactions.create!(credit_card_number: 1111222233334444, credit_card_expiration_date: '', result: 0)

        expect(merchant.best_day).to eq("2012-03-25 09:54:09 UTC")
      end
    end
  end

  describe 'class methods' do
    describe 'top_five_by_revenue' do
      it 'returns the top five merchants' do
        customer = Customer.create!(first_name: "Very", last_name: "Rich")

        merchant3 = Merchant.create!(name: "CCC")
        item3 = merchant3.items.create!(name: "thing", description: "thingy", unit_price: 10)
        invoice3 = customer.invoices.create!(status: 0)
        transaction3 = invoice3.transactions.create!(credit_card_number: 1111222233334444, credit_card_expiration_date: '', result: 1)
        invoice_item7 = InvoiceItem.create!(item: item3, invoice: invoice3, quantity: 3, unit_price: 5, status: 2)
        invoice_item8 = InvoiceItem.create!(item: item3, invoice: invoice3, quantity: 3, unit_price: 5, status: 2)
        invoice_item9 = InvoiceItem.create!(item: item3, invoice: invoice3, quantity: 3, unit_price: 5, status: 2)

        merchant5 = Merchant.create!(name: "EEE")
        item5 = merchant5.items.create!(name: "thing", description: "thingy", unit_price: 10)
        invoice5 = customer.invoices.create!(status: 0)
        transaction5 = invoice5.transactions.create!(credit_card_number: 1111222233334444, credit_card_expiration_date: '', result: 1)
        invoice_item13 = InvoiceItem.create!(item: item5, invoice: invoice5, quantity: 5, unit_price: 5, status: 2)
        invoice_item14 = InvoiceItem.create!(item: item5, invoice: invoice5, quantity: 5, unit_price: 5, status: 2)
        invoice_item15 = InvoiceItem.create!(item: item5, invoice: invoice5, quantity: 5, unit_price: 5, status: 2)

        merchant1 = Merchant.create!(name: "AAA")
        item1 = merchant1.items.create!(name: "thing", description: "thingy", unit_price: 10)
        invoice1 = customer.invoices.create!(status: 0)
        transaction1 = invoice1.transactions.create!(credit_card_number: 1111222233334444, credit_card_expiration_date: '', result: 1)
        invoice_item1 = InvoiceItem.create!(item: item1, invoice: invoice1, quantity: 1, unit_price: 5, status: 2)
        invoice_item2 = InvoiceItem.create!(item: item1, invoice: invoice1, quantity: 1, unit_price: 5, status: 0)
        invoice_item3 = InvoiceItem.create!(item: item1, invoice: invoice1, quantity: 1, unit_price: 5, status: 1)

        merchant6 = Merchant.create!(name: "FFF")
        item6 = merchant6.items.create!(name: "thing", description: "thingy", unit_price: 10)
        invoice6 = customer.invoices.create!(status: 0)
        transaction6 = invoice6.transactions.create!(credit_card_number: 1111222233334444, credit_card_expiration_date: '', result: 0)
        invoice_item16 = InvoiceItem.create!(item: item6, invoice: invoice6, quantity: 6, unit_price: 5, status: 2)
        invoice_item17 = InvoiceItem.create!(item: item6, invoice: invoice6, quantity: 6, unit_price: 5, status: 2)
        invoice_item18 = InvoiceItem.create!(item: item6, invoice: invoice6, quantity: 6, unit_price: 5, status: 2)

        merchant7 = Merchant.create!(name: "GGG")
        item7 = merchant7.items.create!(name: "thing", description: "thingy", unit_price: 10)
        invoice7 = customer.invoices.create!(status: 0)
        transaction7 = invoice7.transactions.create!(credit_card_number: 1111222233334444, credit_card_expiration_date: '', result: 1)
        invoice_item19 = InvoiceItem.create!(item: item7, invoice: invoice7, quantity: 7, unit_price: 5, status: 2)
        invoice_item20 = InvoiceItem.create!(item: item7, invoice: invoice7, quantity: 7, unit_price: 5, status: 2)
        invoice_item21 = InvoiceItem.create!(item: item7, invoice: invoice7, quantity: 7, unit_price: 5, status: 2)

        merchant4 = Merchant.create!(name: "DDD")
        item4 = merchant4.items.create!(name: "thing", description: "thingy", unit_price: 10)
        invoice4 = customer.invoices.create!(status: 0)
        transaction4 = invoice4.transactions.create!(credit_card_number: 1111222233334444, credit_card_expiration_date: '', result: 1)
        invoice_item10 = InvoiceItem.create!(item: item4, invoice: invoice4, quantity: 4, unit_price: 5, status: 2)
        invoice_item11 = InvoiceItem.create!(item: item4, invoice: invoice4, quantity: 4, unit_price: 5, status: 2)
        invoice_item12 = InvoiceItem.create!(item: item4, invoice: invoice4, quantity: 4, unit_price: 5, status: 2)

        merchant2 = Merchant.create!(name: "BBB")
        item2 = merchant2.items.create!(name: "thing", description: "thingy", unit_price: 10)
        invoice2 = customer.invoices.create!(status: 0)
        transaction2 = invoice2.transactions.create!(credit_card_number: 1111222233334444, credit_card_expiration_date: '', result: 1)
        invoice_item4 = InvoiceItem.create!(item: item2, invoice: invoice2, quantity: 2, unit_price: 5, status: 2)
        invoice_item5 = InvoiceItem.create!(item: item2, invoice: invoice2, quantity: 2, unit_price: 5, status: 2)
        invoice_item6 = InvoiceItem.create!(item: item2, invoice: invoice2, quantity: 2, unit_price: 5, status: 2)

        expect(Merchant.top_five_by_revenue).to eq([merchant7, merchant5, merchant4, merchant3, merchant2])
      end
    end
  end


  describe 'top_five_customers' do
    it "returns the  5 customers with the most sucessful transactions, along with their first and last names" do
      merchant = Merchant.create(name: 'Bob Cella')

      item_a = merchant.items.create!(name: "thing", description: "item of a thing", unit_price: 100)
      item_b = merchant.items.create!(name: "stuff", description: "bla bla bla", unit_price: 50)
      item_c = merchant.items.create!(name: "doo-hicky", description: "stuffy stuff", unit_price: 200)

      customer_a = Customer.create!(first_name: "albert", last_name: "anderston")
      customer_b = Customer.create!(first_name: "billy", last_name: "baxter")
      customer_c = Customer.create!(first_name: "charlot", last_name: "carlston")
      customer_d = Customer.create!(first_name: "dany", last_name: "devino")
      customer_e = Customer.create!(first_name: "ellen", last_name: "east")
      customer_f = Customer.create!(first_name: "fredy", last_name: "fox")
      customer_g = Customer.create!(first_name: "george", last_name: "gill")
      customer_h = Customer.create!(first_name: "harry", last_name: "harrison")

      invoice_1a = customer_a.invoices.create!(status: 0)
      invoice_2a = customer_a.invoices.create!(status: 1)
      invoice_3a = customer_a.invoices.create!(status: 2)

      invoice_1b = customer_b.invoices.create!(status: 0)
      invoice_2b = customer_b.invoices.create!(status: 1)
      invoice_3b = customer_b.invoices.create!(status: 2)

      invoice_1c = customer_c.invoices.create!(status: 0)
      invoice_2c = customer_c.invoices.create!(status: 1)
      invoice_3c = customer_c.invoices.create!(status: 2)

      invoice_1d = customer_d.invoices.create!(status: 0)
      invoice_2d = customer_d.invoices.create!(status: 1)
      invoice_3d = customer_d.invoices.create!(status: 2)

      invoice_1e = customer_e.invoices.create!(status: 0)
      invoice_2e = customer_e.invoices.create!(status: 1)
      invoice_3e = customer_e.invoices.create!(status: 2)

      invoice_1f = customer_f.invoices.create!(status: 0)
      invoice_2f = customer_f.invoices.create!(status: 1)
      invoice_3f = customer_f.invoices.create!(status: 2)

      invoice_1g = customer_g.invoices.create!(status: 0)
      invoice_2g = customer_g.invoices.create!(status: 1)
      invoice_3g = customer_g.invoices.create!(status: 2)

      invoice_1h = customer_h.invoices.create!(status: 0)
      invoice_2h = customer_h.invoices.create!(status: 1)
      invoice_3h = customer_h.invoices.create!(status: 2)

      transaction_1	= invoice_1a.transactions.create!(credit_card_number: 4654405418249632,	result: 1, credit_card_expiration_date: nil)
      transaction_2	= invoice_2a.transactions.create!(credit_card_number: 4580251236515201,	result: 1, credit_card_expiration_date: nil)
      transaction_3	= invoice_3a.transactions.create!(credit_card_number: 4354495077693036, result: 1, credit_card_expiration_date: nil)
      transaction_4	= invoice_1b.transactions.create!(credit_card_number: 4515551623735607, result: 1, credit_card_expiration_date: nil)
      transaction_5	= invoice_2b.transactions.create!(credit_card_number: 4844518708741275, result: 1, credit_card_expiration_date: nil)
      transaction_6	= invoice_3b.transactions.create!(credit_card_number: 4203696133194408, result: 1, credit_card_expiration_date: nil)
      transaction_7	= invoice_1c.transactions.create!(credit_card_number: 4801647818676136, result: 1, credit_card_expiration_date: nil)
      transaction_8	= invoice_2c.transactions.create!(credit_card_number: 4540842003561938, result: 0, credit_card_expiration_date: nil)
      transaction_9	= invoice_3c.transactions.create!(credit_card_number: 4140149827486249, result: 1, credit_card_expiration_date: nil)

      transaction_11	= invoice_1d.transactions.create!(credit_card_number: 4654405418249632,	result: 0, credit_card_expiration_date: nil)
      transaction_12	= invoice_2d.transactions.create!(credit_card_number: 4580251236515201,	result: 1, credit_card_expiration_date: nil)
      transaction_13	= invoice_3d.transactions.create!(credit_card_number: 4354495077693036, result: 1, credit_card_expiration_date: nil)
      transaction_14	= invoice_1e.transactions.create!(credit_card_number: 4515551623735607, result: 0, credit_card_expiration_date: nil)
      transaction_15	= invoice_2e.transactions.create!(credit_card_number: 4844518708741275, result: 1, credit_card_expiration_date: nil)
      transaction_16	= invoice_3e.transactions.create!(credit_card_number: 4203696133194408, result: 0, credit_card_expiration_date: nil)
      transaction_17	= invoice_1f.transactions.create!(credit_card_number: 4801647818676136, result: 0, credit_card_expiration_date: nil)
      transaction_18	= invoice_2f.transactions.create!(credit_card_number: 4540842003561938, result: 0, credit_card_expiration_date: nil)
      transaction_19	= invoice_3f.transactions.create!(credit_card_number: 4140149827486249, result: 1, credit_card_expiration_date: nil)

      transaction_21	= invoice_1g.transactions.create!(credit_card_number: 4654405418249632,	result: 1, credit_card_expiration_date: nil)
      transaction_22	= invoice_2g.transactions.create!(credit_card_number: 4580251236515201,	result: 0, credit_card_expiration_date: nil)
      transaction_23	= invoice_3g.transactions.create!(credit_card_number: 4354495077693036, result: 0, credit_card_expiration_date: nil)
      transaction_24	= invoice_1h.transactions.create!(credit_card_number: 4515551623735607, result: 1, credit_card_expiration_date: nil)
      transaction_25	= invoice_2h.transactions.create!(credit_card_number: 4844518708741275, result: 1, credit_card_expiration_date: nil)
      transaction_26	= invoice_3h.transactions.create!(credit_card_number: 4203696133194408, result: 1, credit_card_expiration_date: nil)

      invoice_item_1a = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_1a.id, item_id: item_a.id)
      invoice_item_2a = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_2a.id, item_id: item_b.id)
      invoice_item_3a = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_3a.id, item_id: item_c.id)

      invoice_item_1b = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_1b.id, item_id: item_a.id)
      invoice_item_2b = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_2b.id, item_id: item_b.id)
      invoice_item_3b = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_3b.id, item_id: item_c.id)

      invoice_item_1c = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_1c.id, item_id: item_a.id)
      invoice_item_2c = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_2c.id, item_id: item_b.id)
      invoice_item_3c = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_3c.id, item_id: item_c.id)

      invoice_item_1d = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_1d.id, item_id: item_a.id)
      invoice_item_2d = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_2d.id, item_id: item_b.id)
      invoice_item_3d = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_3d.id, item_id: item_c.id)

      invoice_item_1e = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_1e.id, item_id: item_a.id)
      invoice_item_2e = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_2e.id, item_id: item_b.id)
      invoice_item_3e = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_3e.id, item_id: item_c.id)

      invoice_item_1f = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_1f.id, item_id: item_a.id)
      invoice_item_2f = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_2f.id, item_id: item_b.id)
      invoice_item_3f = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_3f.id, item_id: item_c.id)

      invoice_item_1g = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_1g.id, item_id: item_a.id)
      invoice_item_2g = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_2g.id, item_id: item_b.id)
      invoice_item_3g = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_3g.id, item_id: item_c.id)

      invoice_item_1h = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_1h.id, item_id: item_a.id)
      invoice_item_2h = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_2h.id, item_id: item_b.id)
      invoice_item_3h = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_3h.id, item_id: item_c.id)

      expected_result = { [customer_a.id, "albert", "anderston"]=>3,
                          [customer_b.id, "billy", "baxter"]=>3,
                          [customer_h.id, "harry", "harrison"]=>3,
                          [customer_d.id, "dany", "devino"]=>2,
                          [customer_c.id, "charlot", "carlston"]=>2
                        }

      expect(merchant.top_five_customers).to eq(expected_result)
    end
  end

  describe 'ship_ready' do
    it 'returns info of all orders that a merchant has not shiped in order of date made' do
      merchant = Merchant.create(name: 'Bob Cella')

      item_a = merchant.items.create!(name: "thing", description: "item of a thing", unit_price: 100)
      item_b = merchant.items.create!(name: "stuff", description: "bla bla bla", unit_price: 50)
      item_c = merchant.items.create!(name: "doo-hicky", description: "stuffy stuff", unit_price: 200)

      customer_a = Customer.create!(first_name: "albert", last_name: "anderston")
      customer_b = Customer.create!(first_name: "billy", last_name: "baxter")
      customer_c = Customer.create!(first_name: "charlot", last_name: "carlston")

      invoice_1a = customer_a.invoices.create!(status: 0)
      invoice_2a = customer_a.invoices.create!(status: 1)
      invoice_3a = customer_a.invoices.create!(status: 2)

      invoice_1b = customer_b.invoices.create!(status: 0)
      invoice_2b = customer_b.invoices.create!(status: 1)
      invoice_3b = customer_b.invoices.create!(status: 2)

      invoice_1c = customer_c.invoices.create!(status: 0)
      invoice_2c = customer_c.invoices.create!(status: 1)
      invoice_3c = customer_c.invoices.create!(status: 2)

      invoice_item_1a = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 2, invoice_id: invoice_1a.id, item_id: item_a.id)
      invoice_item_2a = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_2a.id, item_id: item_b.id)
      invoice_item_3a = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_3a.id, item_id: item_c.id)

      invoice_item_1b = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_1b.id, item_id: item_a.id)
      invoice_item_2b = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 2, invoice_id: invoice_2b.id, item_id: item_b.id)
      invoice_item_3b = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_3b.id, item_id: item_c.id)

      invoice_item_1c = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_1c.id, item_id: item_a.id)
      invoice_item_2c = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_2c.id, item_id: item_b.id)
      invoice_item_3c = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 2, invoice_id: invoice_3c.id, item_id: item_c.id)


      expect(merchant.ship_ready[0][0]).to eq(item_c.name)
      expect(merchant.ship_ready[0][1]).to eq(invoice_3a.id)
      expect(merchant.ship_ready[0][2]).to eq(invoice_3a.created_at)

      expect(merchant.ship_ready[1][0]).to eq(item_a.name)
      expect(merchant.ship_ready[1][1]).to eq(invoice_1b.id)
      expect(merchant.ship_ready[1][2]).to eq(invoice_1b.created_at)

      expect(merchant.ship_ready[2][0]).to eq(item_c.name)
      expect(merchant.ship_ready[2][1]).to eq(invoice_3b.id)
      expect(merchant.ship_ready[2][2]).to eq(invoice_3b.created_at)

      expect(merchant.ship_ready[3][0]).to eq(item_a.name)
      expect(merchant.ship_ready[3][1]).to eq(invoice_1c.id)
      expect(merchant.ship_ready[3][2]).to eq(invoice_1c.created_at)
    end
  end

  describe 'unique_invoices' do
    it " returns all invoices once" do
      merchant = Merchant.create(name: 'Bob Cella')
      merchant_2 = Merchant.create(name: 'cella bob')

      item_a = merchant.items.create!(name: "thing", description: "item of a thing", unit_price: 100)
      item_b = merchant.items.create!(name: "stuff", description: "bla bla bla", unit_price: 50)
      item_c = merchant_2.items.create!(name: "doo-hicky", description: "stuffy stuff", unit_price: 200)

      customer_a = Customer.create!(first_name: "albert", last_name: "anderston")
      customer_b = Customer.create!(first_name: "billy", last_name: "baxter")

      invoice_1a = customer_a.invoices.create!(status: 0)
      invoice_2a = customer_a.invoices.create!(status: 1)

      invoice_1b = customer_b.invoices.create!(status: 0)
      invoice_2b = customer_b.invoices.create!(status: 1)


      invoice_item_1a = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 2, invoice_id: invoice_1a.id, item_id: item_a.id)
      invoice_item_2a = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_2a.id, item_id: item_b.id)
      invoice_item_3a = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_2a.id, item_id: item_c.id)

      invoice_item_1b = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_1b.id, item_id: item_a.id)
      invoice_item_2b = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 2, invoice_id: invoice_1b.id, item_id: item_b.id)
      invoice_item_3b = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_2b.id, item_id: item_c.id)



      expect(merchant.unique_invoices).to eq([invoice_1a, invoice_2a, invoice_1b])

    end
  end


>>>>>>> bulk
end
