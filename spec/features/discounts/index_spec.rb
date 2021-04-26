require 'rails_helper'

RSpec.describe 'the merchant discount index', type: :feature do
  before(:each) do
    @merchant_1 = Merchant.create!(name: "AA")
    @merchant_2 = Merchant.create!(name: "BB")

    @employee_1 = @merchant_1.discounts.create!(percent: 28, quantity: 5)
    @flier_1 = @merchant_1.discounts.create!(percent: 10, quantity: 10)
    @tv_1 = @merchant_1.discounts.create!(percent: 15, quantity: 3)
    @promo_2 = @merchant_2.discounts.create!(percent: 12, quantity: 10)
    @single_2 = @merchant_2.discounts.create!(percent: 20, quantity: 1)

    # @jerde = Merchant.create!(name: 'Schroeder-Jerde')
    # @willms = Merchant.create!(name: 'Willms and Sons')
    # @thiel = Merchant.create!(name: 'Cummings-Thiel')
    # @qui = @jerde.items.create!(name: 'Qui Esse', description: 'Nihil autem', unit_price: 75107, able: "Disabled")
    # @autem = @jerde.items.create!(name: 'Autem Minima', description: 'Cumque consequuntur ad', unit_price: 67076, able: "Enabled")
    # @ea = @jerde.items.create!(name: 'Ea Voluptatum', description: 'Sunt officia', unit_price: 32301, able: "Enabled")
    # @nemo = @willms.items.create!(name: 'Nemo Facere', description: 'Sunt eum id', unit_price: 4291, able: "Disabled")
  end

  it 'has a link to merchants dashboard' do
    visit "/merchants/#{@merchant_1.id}/dashboard"
      expect(page).to have_link("Dashboard")
      click_link("Dashboard")
      expect(current_path).to eq("/merchants/#{@merchant_1.id}/dashboard")
  end

  it 'lists of all merchant discounts, quantities' do
    visit "/merchants/#{@merchant_1.id}/discounts"

    within "#discount-#{@employee_1.id}" do
      expect(page).to have_link(@employee_1.percent)
      expect(page).to have_content(@employee_1.quantity)
    end

    within "#discount-#{@flier_1.id}" do
      expect(page).to have_link(@flier_1.percent)
      expect(page).to have_content(@flier_1.quantity)
    end

    within "#discount-#{@tv_1.id}" do
      expect(page).to have_link(@tv_1.percent)
      expect(page).to have_content(@tv_1.quantity)
    end
  end

  it 'has Enable button by Disabled discounts' do
    visit "/merchants/#{@merchant_1.id}/discounts"

    expect(page).to have_content(@qui.name)
    expect(page).to have_button("Enable")
    # click_button "Enable"
    # expect(current_path).to eq("/merchants/#{@merchant_1.id}/discounts")
    # expect(page).to have_button("Disable")
    # expect(page).to_not have_button("Enable")
  end

  it "has a link to 'Create NEW Item'" do
    visit "/merchants/#{@jerde.id}/items"
      click_on "Create NEW Item"
    expect(current_path).to eq("/merchants/#{@jerde.id}/items/new")
  end     #merchant items us#6-1

  it "has form to create new item" do
      visit "/merchants/#{@jerde.id}/items/new"
      # save_and_open_page
    expect(page).to have_content('New Item')
    # expect(find('form')).to have_content('Name')
    # expect(find('form')).to have_content('Description')
    # expect(find('form')).to have_content('Unit price')
    expect(page).to have_button("Submit")
    #   click_on "Submit"
    # expect(current_path).to eq("/merchants/#{@jerde.id}/items")
  end

  describe 'Upcoming Holidays section' do
    it 'shows section for Upcoming Holidays' do
      visit "/merchants/#{@merchant_1.id}/discounts"

      expect(page).to have_content("Upcoming Holidays")
    end
    #
    # it 'shows best sale day for Most Popular Items"' do
    #   visit "/merchants/#{@jerde.id}/items"
    #
    #   expect(page).to have_content("Top sales date")
    # end
  end
  # Merchant Items Index: 5 most popular items
  # As a merchant, When I visit my items index page
  # Then I see the names of the top 5 most popular items ranked by total revenue generated
  # And I see that each item name links to my merchant item show page for that item
  # And I see the total revenue generated next to each item name
  #
  # Notes on Revenue Calculation:
  # - Only invoices with at least one successful transaction should count towards revenue
  # - Revenue for an invoice should be calculated as the sum of the revenue of all invoice items
  # - Revenue for an invoice item should be calculated as the invoice item unit price multiplied by the quantity (do not use the item unit price)

  # Merchant Items Index: Top Item's Best Day
  # When I visit the items index page
  # Then next to each of the 5 most popular items I see the date with the most sales for each item.
  # And I see a label “Top selling date for <item name> was <date with most sales>"
  # Note: use the invoice date. If there are multiple days with equal number of sales, return the most recent day.
end
