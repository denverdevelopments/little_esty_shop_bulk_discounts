require 'rails_helper'

<<<<<<< HEAD
describe 'Admin Invoices Index Page' do
  before :each do
    @m1 = Merchant.create!(name: 'Merchant 1')

    @c1 = Customer.create!(first_name: 'Yo', last_name: 'Yoz')
    @c2 = Customer.create!(first_name: 'Hey', last_name: 'Heyz')

    @i1 = Invoice.create!(customer_id: @c1.id, status: 2)
    @i2 = Invoice.create!(customer_id: @c1.id, status: 2)
    @i3 = Invoice.create!(customer_id: @c2.id, status: 2)
    @i4 = Invoice.create!(customer_id: @c2.id, status: 2)
    visit admin_invoices_path
  end

  it 'should list all invoice ids in the system as links to their show page' do
    expect(page).to have_link("Invoice ##{@i1.id}")
    expect(page).to have_link("Invoice ##{@i2.id}")
    expect(page).to have_link("Invoice ##{@i3.id}")
    expect(page).to have_link("Invoice ##{@i4.id}")
  end
end
=======
RSpec.describe 'admin invoices index page', type: :feature do
  it 'has of list of all invoice ids as links to their show pages' do
    customer = Customer.create!(first_name: "A", last_name: "AA")
    invoice1 = customer.invoices.create!(status: 0)
    invoice2 = customer.invoices.create!(status: 1)
    invoice3 = customer.invoices.create!(status: 2)
    
    visit '/admin/invoices'
    
    within("#invoice-#{invoice1.id}") do
      expect(page).to have_link(invoice1.id)
    end
    
    within("#invoice-#{invoice2.id}") do
      expect(page).to have_link(invoice2.id)
    end
    
    within("#invoice-#{invoice3.id}") do
      expect(page).to have_link(invoice3.id)
    end
  end
end
>>>>>>> bulk
