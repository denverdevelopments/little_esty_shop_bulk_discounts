require 'rails_helper'

RSpec.describe Item, type: :model do
<<<<<<< HEAD
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :unit_price }
    it { should validate_presence_of :merchant_id }
  end
  describe "relationships" do
    it { should have_many(:invoices).through(:invoice_items) }
    it { should belong_to :merchant }
  end
  describe "instance methods" do
    it "best day" do
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

      @invoice_1 = Invoice.create!(customer_id: @customer_1.id, status: 2,  created_at: "2012-03-27 14:54:09")
      @invoice_2 = Invoice.create!(customer_id: @customer_1.id, status: 2,  created_at: "2012-03-28 14:54:09")
      @invoice_3 = Invoice.create!(customer_id: @customer_2.id, status: 2)
      @invoice_4 = Invoice.create!(customer_id: @customer_3.id, status: 2)
      @invoice_5 = Invoice.create!(customer_id: @customer_4.id, status: 2)
      @invoice_6 = Invoice.create!(customer_id: @customer_5.id, status: 2)
      @invoice_7 = Invoice.create!(customer_id: @customer_6.id, status: 1)

      @ii_1 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_1.id, quantity: 9, unit_price: 10, status: 2, created_at: "2012-03-27 14:54:09")
      @ii_2 = InvoiceItem.create!(invoice_id: @invoice_2.id, item_id: @item_1.id, quantity: 9, unit_price: 10, status: 2, created_at: "2012-03-28 14:54:09")
      @ii_3 = InvoiceItem.create!(invoice_id: @invoice_3.id, item_id: @item_2.id, quantity: 2, unit_price: 8, status: 2)
      @ii_4 = InvoiceItem.create!(invoice_id: @invoice_4.id, item_id: @item_3.id, quantity: 3, unit_price: 5, status: 1)
      @ii_6 = InvoiceItem.create!(invoice_id: @invoice_5.id, item_id: @item_4.id, quantity: 1, unit_price: 1, status: 1)
      @ii_7 = InvoiceItem.create!(invoice_id: @invoice_6.id, item_id: @item_7.id, quantity: 1, unit_price: 3, status: 1)
      @ii_8 = InvoiceItem.create!(invoice_id: @invoice_7.id, item_id: @item_8.id, quantity: 1, unit_price: 5, status: 1)
      @ii_9 = InvoiceItem.create!(invoice_id: @invoice_7.id, item_id: @item_4.id, quantity: 1, unit_price: 1, status: 1)

      @transaction1 = Transaction.create!(credit_card_number: 203942, result: 1, invoice_id: @invoice_1.id)
      @transaction2 = Transaction.create!(credit_card_number: 230948, result: 1, invoice_id: @invoice_2.id)
      @transaction3 = Transaction.create!(credit_card_number: 234092, result: 1, invoice_id: @invoice_3.id)
      @transaction4 = Transaction.create!(credit_card_number: 230429, result: 1, invoice_id: @invoice_4.id)
      @transaction5 = Transaction.create!(credit_card_number: 102938, result: 1, invoice_id: @invoice_5.id)
      @transaction6 = Transaction.create!(credit_card_number: 879799, result: 0, invoice_id: @invoice_6.id)
      @transaction7 = Transaction.create!(credit_card_number: 203942, result: 1, invoice_id: @invoice_7.id)

      expect(@item_1.best_day).to eq(@invoice_2.created_at.to_date)
=======
  describe 'relationships' do
    it { should belong_to(:merchant) }
    it { should have_many(:invoice_items) }
    it { should have_many(:invoices).through(:invoice_items) }

  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:unit_price) }
    it { should validate_numericality_of(:unit_price) }
    it { should validate_presence_of(:able) }

  end

  before(:each) do
    @merchant1 = Merchant.create!(name: "CCC")
    @item1 = @merchant1.items.create!(name: "it1", description: "thing", unit_price: 10, able: "Disabled")
    @item2 = @merchant1.items.create!(name: "it2", description: "thing", unit_price: 20, able: "Enabled")
    @item3 = @merchant1.items.create!(name: "it3", description: "thing", unit_price: 30, able: "Enabled")
    @item4 = @merchant1.items.create!(name: "it4", description: "thing", unit_price: 40, able: "Disabled")
    @item5 = @merchant1.items.create!(name: "it5", description: "thing", unit_price: 50, able: "Disabled")


    customer = Customer.create!(first_name: "Pat", last_name: "Jones")

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

  describe 'class methods' do
    # describe 'disabled' do
    #   it 'shows only items with disabled status' do
    #   end
    # end
    #
    # describe 'enabled' do
    #   it 'shows only items with enabled status' do
    #   end
    # end

    describe 'top_five_items' do
      it 'shows the top 5 items by revenue' do

      end
    end
  end

  describe 'instance methods' do
    describe 'item_best_day' do
      it 'shows date with most sales for item' do

      end
>>>>>>> bulk
    end
  end
end
