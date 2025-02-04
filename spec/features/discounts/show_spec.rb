require 'rails_helper'

RSpec.describe 'the merchant discount show page', type: :feature do
  before(:each)do
    @merchant_1 = Merchant.create!(name: "AA")
    @discount_1 = @merchant_1.discounts.create!(percent: 28, quantity: 5)
  end

  it 'shows bulk discounts percentage and quantity min' do

    visit "/merchants/#{@merchant_1.id}/discounts/#{@discount_1.id}"

    expect(page).to have_content("Bulk Discount")
    expect(page).to have_content(@merchant_1.id)
    expect(page).to have_content(@discount_1.percent)
    expect(page).to have_content(@discount_1.quantity)
  end

  it 'has link to edit discount' do
    visit "/merchants/#{@merchant_1.id}/discounts/#{@discount_1.id}"
    expect(page).to have_link("Edit Discount")
      click_link "Edit Discount"
    expect(current_path).to eq("/merchants/#{@merchant_1.id}/discounts/#{@discount_1.id}/edit")
  end 
end
