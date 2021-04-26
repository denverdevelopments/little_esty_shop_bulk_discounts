require 'rails_helper'

<<<<<<< HEAD
describe 'Admin Invoices Index Page' do
  before :each do
    @m1 = Merchant.create!(name: 'Merchant 1')

    @c1 = Customer.create!(first_name: 'Yo', last_name: 'Yoz', address: '123 Heyyo', city: 'Whoville', state: 'CO', zip: 12345)
    @c2 = Customer.create!(first_name: 'Hey', last_name: 'Heyz')

    @i1 = Invoice.create!(customer_id: @c1.id, status: 2, created_at: '2012-03-25 09:54:09')
    @i2 = Invoice.create!(customer_id: @c2.id, status: 1, created_at: '2012-03-25 09:30:09')

    @item_1 = Item.create!(name: 'test', description: 'lalala', unit_price: 6, merchant_id: @m1.id)
    @item_2 = Item.create!(name: 'rest', description: 'dont test me', unit_price: 12, merchant_id: @m1.id)

    @ii_1 = InvoiceItem.create!(invoice_id: @i1.id, item_id: @item_1.id, quantity: 12, unit_price: 2, status: 0)
    @ii_2 = InvoiceItem.create!(invoice_id: @i1.id, item_id: @item_2.id, quantity: 6, unit_price: 1, status: 1)
    @ii_3 = InvoiceItem.create!(invoice_id: @i2.id, item_id: @item_2.id, quantity: 87, unit_price: 12, status: 2)

    visit admin_invoice_path(@i1)
  end

  it 'should display the id, status and created_at' do
    expect(page).to have_content("Invoice ##{@i1.id}")
    expect(page).to have_content("Created on: #{@i1.created_at.strftime("%A, %B %d, %Y")}")

    expect(page).to_not have_content("Invoice ##{@i2.id}")
  end

  it 'should display the customers name and shipping address' do
    expect(page).to have_content("#{@c1.first_name} #{@c1.last_name}")
    expect(page).to have_content(@c1.address)
    expect(page).to have_content("#{@c1.city}, #{@c1.state} #{@c1.zip}")

    expect(page).to_not have_content("#{@c2.first_name} #{@c2.last_name}")
  end

  it 'should display all the items on the invoice' do
    expect(page).to have_content(@item_1.name)
    expect(page).to have_content(@item_2.name)

    expect(page).to have_content(@ii_1.quantity)
    expect(page).to have_content(@ii_2.quantity)

    expect(page).to have_content("$#{@ii_1.unit_price}")
    expect(page).to have_content("$#{@ii_2.unit_price}")

    expect(page).to have_content(@ii_1.status)
    expect(page).to have_content(@ii_2.status)

    expect(page).to_not have_content(@ii_3.quantity)
    expect(page).to_not have_content("$#{@ii_3.unit_price}")
    expect(page).to_not have_content(@ii_3.status)
  end

  it 'should display the total revenue the invoice will generate' do
    expect(page).to have_content("Total Revenue: $#{@i1.total_revenue}")

    expect(page).to_not have_content(@i2.total_revenue)
  end

  it 'should have status as a select field that updates the invoices status' do
    within("#status-update-#{@i1.id}") do
      select('cancelled', :from => 'invoice[status]')
      expect(page).to have_button('Update Invoice')
      click_button 'Update Invoice'

      expect(current_path).to eq(admin_invoice_path(@i1))
      expect(@i1.status).to eq('complete')
    end
  end
end
=======
RSpec.describe 'admin invoice show page', type: :feature do
  it 'has the invoice: id, status' do
    customer = Customer.create!(first_name: "A", last_name: "AA")
    invoice1 = customer.invoices.create!(status: 'in progress')
    
    visit "/admin/invoices/#{invoice1.id}"
    
    expect(page).to have_content("#{invoice1.id}")
    expect(page).to have_content("#{invoice1.status}")
  end
  
  it "has the customer name, created_at 'Thursday, July 18, 2019'" do
    customer = Customer.create!(first_name: "A", last_name: "AA")
    invoice1 = customer.invoices.create!(status: 'in progress', created_at: 'Thursday, July 18, 2019')
    
    visit "/admin/invoices/#{invoice1.id}"
    expect(page).to have_content(customer.first_name)
    expect(page).to have_content(customer.last_name)
    expect(page).to have_content('Thursday, July 18, 2019')
  end

  it 'shows all the items on that invoice' do
    customer = Customer.create!(first_name: "A", last_name: "AA")
    merchant = Merchant.create!(name: "merchant")
    invoice1 = customer.invoices.create!(status: 'in progress')
    item1 = merchant.items.create!(name: "thing", description: "thingy", unit_price: 1)
    item2 = merchant.items.create!(name: "stuff", description: "stuffy", unit_price: 2)
    item3 = merchant.items.create!(name: "it", description: "itty", unit_price: 3)
    item4 = merchant.items.create!(name: "fake", description: "fakey", unit_price: 4)
    invoice_item1 = InvoiceItem.create!(item: item1, invoice: invoice1, quantity:10, unit_price: 11, status: 0)
    invoice_item2 = InvoiceItem.create!(item: item2, invoice: invoice1, quantity:20, unit_price: 22, status: 1)
    invoice_item3 = InvoiceItem.create!(item: item3, invoice: invoice1, quantity:30, unit_price: 33, status: 2)
    
    visit "/admin/invoices/#{invoice1.id}"
    
    within("#items") do
      within("#item-#{item1.id}") do
        expect(page).to have_content(item1.name)
        expect(page).to have_content(invoice_item1.quantity)
        expect(page).to have_content(invoice_item1.unit_price)
        expect(page).to have_content(invoice_item1.status)
      end

      within("#item-#{item2.id}") do
        expect(page).to have_content(item2.name)
        expect(page).to have_content(invoice_item2.quantity)
        expect(page).to have_content(invoice_item2.unit_price)
        expect(page).to have_content(invoice_item2.status)
      end

      within("#item-#{item3.id}") do
        expect(page).to have_content(item3.name)
        expect(page).to have_content(invoice_item3.quantity)
        expect(page).to have_content(invoice_item3.unit_price)
        expect(page).to have_content(invoice_item3.status)
      end
    end
  end

  it 'displays the total revenue generated by the invoice' do
    customer = Customer.create!(first_name: "A", last_name: "AA")
    invoice1 = customer.invoices.create!(status: 'in progress')
    merchant = Merchant.create!(name: "merchant")
    item1 = merchant.items.create!(name: "thing", description: "thingy", unit_price: 1)
    item2 = merchant.items.create!(name: "stuff", description: "stuffy", unit_price: 2)
    item3 = merchant.items.create!(name: "it", description: "itty", unit_price: 3)
    item4 = merchant.items.create!(name: "fake", description: "fakey", unit_price: 4)
    invoice_item1 = InvoiceItem.create!(item: item1, invoice: invoice1, quantity:1, unit_price: 1, status: 0) #1
    invoice_item2 = InvoiceItem.create!(item: item2, invoice: invoice1, quantity:2, unit_price: 2, status: 1) #4
    invoice_item3 = InvoiceItem.create!(item: item3, invoice: invoice1, quantity:5, unit_price: 10, status: 2) #50
    
    visit "/admin/invoices/#{invoice1.id}"

    within("#invoice_revenue") do
      expect(page).to have_content("Total Revenue: $55")
    end
  end
  
  it 'has a select field with the current status selected' do
    customer = Customer.create!(first_name: "A", last_name: "AA")
    invoice1 = customer.invoices.create!(status: 'in progress')
    
    visit "/admin/invoices/#{invoice1.id}"

    within("#status_select_field") do
      expect(page).to have_content('in progress')
    end
  end
end
>>>>>>> bulk
