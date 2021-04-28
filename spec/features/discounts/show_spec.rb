require 'rails_helper'

RSpec.describe 'the merchant discount show page', type: :feature do
  it 'shows bulk discounts percentage and quantity min' do
    merchant_1 = Merchant.create!(name: "AA")
    employee_1 = merchant_1.discounts.create!(percent: 28, quantity: 5)

    visit "/merchants/#{merchant_1.id}/discounts/#{employee_1.id}"

    expect(page).to have_content("Bulk Discount Show")
    expect(page).to have_content(employee_1.percent)
    expect(page).to have_content(employee_1.quantity)
  end
end
