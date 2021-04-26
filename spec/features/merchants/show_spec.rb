require 'rails_helper'

RSpec.describe 'the merchant show page', type: :feature do
  before(:each) do
    @merchant = Merchant.create(name: 'Bob Cella')
  end

  it "shows the merchant's name" do
    visit "merchants/#{@merchant.id}/dashboard"

    expect(page).to have_content(@merchant.name)
  end

  describe ': there are sight links: and it' do
    it 'has a link to merchants dashboard' do
      visit "/merchants/#{@merchant.id}/items"

      within ("#links") do
        expect(page).to have_link("Dashboard")
        click_link("Dashboard")
        expect(current_path).to eq("/merchants/#{@merchant.id}/dashboard")

        expect(page).to have_link("click to bulk discounts")
        click_link("click to bulk discounts")
        expect(current_path).to eq("/merchants/#{@merchant.id}/discounts")
      end
    end

    it 'has a link to merchant items' do
      visit "/merchants/#{@merchant.id}/items"
      within ("#links") do
        expect(page).to have_link("My Items")
        click_link("My Items")
        expect(current_path).to eq("/merchants/#{@merchant.id}/items")
      end
    end

    it 'has a link to merchant invoices' do
      visit "/merchants/#{@merchant.id}/items"
      within ("#links") do
        expect(page).to have_link("My Invoices")
        click_link("My Invoices")
        expect(current_path).to eq("/merchants/#{@merchant.id}/invoices")
      end
    end
  end

  describe "the merchant's top 5 customers" do
    it "shows top 5 customers" do

      item_a = @merchant.items.create!(name: "thing", description: "item of a thing", unit_price: 100)
      item_b = @merchant.items.create!(name: "stuff", description: "bla bla bla", unit_price: 50)
      item_c = @merchant.items.create!(name: "doo-hicky", description: "stuffy stuff", unit_price: 200)

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
      transaction_8	= invoice_2c.transactions.create!(credit_card_number: 4540842003561938, result: 1, credit_card_expiration_date: nil)
      transaction_9	= invoice_3c.transactions.create!(credit_card_number: 4140149827486249, result: 1, credit_card_expiration_date: nil)

      transaction_11	= invoice_1d.transactions.create!(credit_card_number: 4654405418249632,	result: 0, credit_card_expiration_date: nil)
      transaction_12	= invoice_2d.transactions.create!(credit_card_number: 4580251236515201,	result: 1, credit_card_expiration_date: nil)
      transaction_13	= invoice_3d.transactions.create!(credit_card_number: 4354495077693036, result: 1, credit_card_expiration_date: nil)
      transaction_14	= invoice_1e.transactions.create!(credit_card_number: 4515551623735607, result: 0, credit_card_expiration_date: nil)
      transaction_15	= invoice_2e.transactions.create!(credit_card_number: 4844518708741275, result: 1, credit_card_expiration_date: nil)
      transaction_16	= invoice_3e.transactions.create!(credit_card_number: 4203696133194408, result: 1, credit_card_expiration_date: nil)
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


      visit "merchants/#{@merchant.id}/dashboard"

      expect(page).to have_content("#{customer_a.first_name} #{customer_a.last_name}")
      expect(page).to have_content("#{customer_b.first_name} #{customer_b.last_name}")
      expect(page).to have_content("#{customer_c.first_name} #{customer_c.last_name}")
      expect(page).to have_content("#{customer_h.first_name} #{customer_h.last_name}")
      expect(page).to have_content("#{customer_e.first_name} #{customer_e.last_name}")
    end

    it "shows number of sucessful transactions" do

      item_a = @merchant.items.create!(name: "thing", description: "item of a thing", unit_price: 100)
      item_b = @merchant.items.create!(name: "stuff", description: "bla bla bla", unit_price: 50)
      item_c = @merchant.items.create!(name: "doo-hicky", description: "stuffy stuff", unit_price: 200)

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


      visit "merchants/#{@merchant.id}/dashboard"

      expect(page).to have_content("#{3}")
      expect(page).to have_content("#{3}")
      expect(page).to have_content("#{2}")
      expect(page).to have_content("#{2}")
      expect(page).to have_content("#{3}")
    end
  end

  describe "display item's ready to ship" do
    it "lists items ready to ship" do

      item_a = @merchant.items.create!(name: "thing", description: "item of a thing", unit_price: 100)
      item_b = @merchant.items.create!(name: "stuff", description: "bla bla bla", unit_price: 50)
      item_c = @merchant.items.create!(name: "doo-hicky", description: "stuffy stuff", unit_price: 200)
      item_d = @merchant.items.create!(name: "cool toy", description: "zappow", unit_price: 200)

      customer_a = Customer.create!(first_name: "albert", last_name: "anderston")
      customer_b = Customer.create!(first_name: "billy", last_name: "baxter")
      customer_c = Customer.create!(first_name: "charlot", last_name: "carlston")
      customer_d = Customer.create!(first_name: "dany", last_name: "devino")

      invoice_1a = customer_a.invoices.create!(status: 0)
      invoice_2a = customer_a.invoices.create!(status: 1)

      invoice_1b = customer_b.invoices.create!(status: 1)
      invoice_2b = customer_b.invoices.create!(status: 2)

      invoice_1c = customer_c.invoices.create!(status: 0)
      invoice_2c = customer_c.invoices.create!(status: 1)
      invoice_3c = customer_c.invoices.create!(status: 2)

      invoice_item_1a = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_1a.id, item_id: item_a.id)
      invoice_item_2a = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_1a.id, item_id: item_b.id)
      invoice_item_3a = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_2a.id, item_id: item_c.id)

      invoice_item_1b = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_1b.id, item_id: item_a.id)
      invoice_item_2b = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_2b.id, item_id: item_b.id)
      invoice_item_3b = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_2b.id, item_id: item_c.id)

      invoice_item_1c = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_1c.id, item_id: item_a.id)
      invoice_item_2c = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_2c.id, item_id: item_b.id)
      invoice_item_3c = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 2, invoice_id: invoice_3c.id, item_id: item_c.id)

      visit "merchants/#{@merchant.id}/dashboard"

      expect(page).to have_content("#{item_a.name}")
      expect(page).to have_content("#{item_b.name}")
      expect(page).to have_content("#{item_c.name}")
      expect(page).to have_no_content("#{item_d.name}")
    end

    it "lists items in order of invoice creation" do

      item_a = @merchant.items.create!(name: "thing", description: "item of a thing", unit_price: 100)
      item_b = @merchant.items.create!(name: "stuff", description: "bla bla bla", unit_price: 50)
      item_c = @merchant.items.create!(name: "doo-hicky", description: "stuffy stuff", unit_price: 200)
      item_d = @merchant.items.create!(name: "cool toy", description: "zappow", unit_price: 200)

      customer_a = Customer.create!(first_name: "albert", last_name: "anderston")
      customer_b = Customer.create!(first_name: "billy", last_name: "baxter")
      customer_c = Customer.create!(first_name: "charlot", last_name: "carlston")
      customer_d = Customer.create!(first_name: "dany", last_name: "devino")

      invoice_1a = customer_a.invoices.create!(status: 0)
      invoice_2a = customer_a.invoices.create!(status: 2)

      invoice_1b = customer_b.invoices.create!(status: 0)
      invoice_2b = customer_b.invoices.create!(status: 2)

      invoice_item_1a = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_1a.id, item_id: item_a.id)
      invoice_item_3a = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_2a.id, item_id: item_c.id)

      invoice_item_1b = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_1b.id, item_id: item_a.id)
      invoice_item_2b = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_2b.id, item_id: item_b.id)


      visit "merchants/#{@merchant.id}/dashboard"

      first = find("#item-#{invoice_1a.id}-#{item_a.name}")
      second = find("#item-#{invoice_2a.id}-#{item_c.name}")

      third = find("#item-#{invoice_1b.id}-#{item_a.name}")
      fourth = find("#item-#{invoice_2b.id}-#{item_b.name}")

      expect(first).to appear_before(second)
      expect(second).to appear_before(third)
      expect(third).to appear_before(fourth)
    end

    it 'has invoice id number as a link' do

      item_a = @merchant.items.create!(name: "thing", description: "item of a thing", unit_price: 100)
      customer_a = Customer.create!(first_name: "albert", last_name: "anderston")
      invoice_1a = customer_a.invoices.create!(status: 0)
      invoice_item_1a = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 0, invoice_id: invoice_1a.id, item_id: item_a.id)

      visit "/merchants/#{@merchant.id}/dashboard"
      click_link("#{invoice_1a.id}")

      expect(page).to have_current_path("/merchants/#{@merchant.id}/invoices/#{invoice_1a.id}")
    end

    it 'has date of invoices' do

      item_a = @merchant.items.create!(name: "thing", description: "item of a thing", unit_price: 100)
      item_b = @merchant.items.create!(name: "stuff", description: "bla bla bla", unit_price: 50)
      item_c = @merchant.items.create!(name: "doo-hicky", description: "stuffy stuff", unit_price: 200)
      item_d = @merchant.items.create!(name: "cool toy", description: "zappow", unit_price: 200)

      customer_a = Customer.create!(first_name: "albert", last_name: "anderston")
      customer_b = Customer.create!(first_name: "billy", last_name: "baxter")

      invoice_1a = customer_a.invoices.create!(status: 0)
      invoice_2a = customer_a.invoices.create!(status: 2)

      invoice_1b = customer_b.invoices.create!(status: 0)
      invoice_2b = customer_b.invoices.create!(status: 2)

      invoice_item_1a = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_1a.id, item_id: item_a.id)
      invoice_item_3a = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_2a.id, item_id: item_c.id)

      invoice_item_1b = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_1b.id, item_id: item_a.id)
      invoice_item_2b = InvoiceItem.create!(quantity: 5, unit_price: 100, status: 1, invoice_id: invoice_2b.id, item_id: item_b.id)


      visit "/merchants/#{@merchant.id}/dashboard"

      expect(page).to have_content(invoice_1a.created_at.strftime("%A, %B %d, %Y"))
      expect(page).to have_content(invoice_2a.created_at.strftime("%A, %B %d, %Y"))
      expect(page).to have_content(invoice_1b.created_at.strftime("%A, %B %d, %Y"))
      expect(page).to have_content(invoice_2b.created_at.strftime("%A, %B %d, %Y"))
    end
  end
end
