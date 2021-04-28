require 'rails_helper'

RSpec.describe 'merchant discount edit page', type: :feature do
  it 'shows the discount edit form' do
    merchant_1 = Merchant.create!(name: "AA")
    discount_1 = merchant_1.discounts.create!(percent: 28, quantity: 5)

    visit "/merchants/#{merchant_1.id}/discounts/#{discount_1.id}/edit"

    expect(page).to have_content("Edit Discount")
    expect(find('form')).to have_content('Percent')
    expect(find('form')).to have_content('Quantity')
    expect(find('form')).to have_button('Submit Edit')
  end

  it 'updates and redirects to discount show page, displays flash' do
    merchant_1 = Merchant.create!(name: "AA")
    discount_1 = merchant_1.discounts.create!(percent: 28, quantity: 5)

    visit "/merchants/#{merchant_1.id}/discounts/#{discount_1.id}/edit"

    fill_in "Percent", with: 33
    click_button "Submit Edit"
    expect(current_path).to eq("/merchants/#{merchant_1.id}/discounts/#{discount_1.id}")
    expect(page).to have_content("Percent Off % 33")
    expect(page).to have_content("Discount was successfully updated.")
  end
end
