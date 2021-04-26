require 'rails_helper'

RSpec.describe 'the create new item form', type: :feature do
  before(:each) do
    @merchant_1 = Merchant.create!(name: "AA")

    @employee_1 = @merchant_1.discounts.create!(percent: 28, quantity: 5)
    @flier_1 = @merchant_1.discounts.create!(percent: 10, quantity: 10)
    # @tv_1 = @merchant_1.discounts.create!(percent: 15, quantity: 3)
  end

  # it 'has a link to merchants discounts index' do
  #   visit "/merchants/#{@merchant_1.id}/discounts"
  #     expect(page).to have_link("Merchant Discounts")
  #     click_link("Merchant Discounts")
  #     expect(current_path).to eq("/merchants/#{@merchant_1.id}/discounts")
  # end

  it 'has form to create new item' do
      visit "/merchants/#{@merchant_1.id}/discounts/new"
      # save_and_open_page
    expect(page).to have_content('New Item')
    expect(find('form')).to have_content('Percentage')
    expect(find('form')).to have_content('Max Quantity')
    expect(page).to have_button("Create Discount")
      click_on "Create Discount"
    expect(current_path).to eq("/merchants/#{@merchant_1.id}/discounts/")
  end

  it "creates a new discount" do
    visit "/merchants/#{@merchant_1.id}/discounts/new"

    fill_in "Percentage", with: 40
    fill_in "Max Quantity", with: 2
      click_button "Create Discount"
    expect(current_path).to eq("/merchants/#{@merchant_1.id}/discounts")
    expect(page).to have_content(40)
  end

  it 'does not allow creating an incomplete discount' do
    visit "/admin/merchants/new"

    fill_in "Max Quantity", with: 2
      click_button "Create Merchant"
    expect(current_path).to eq("/admin/merchants/new")
    expect(page).to have_content("Please enter percentage & quantity")
  end
end
