require 'rails_helper'

RSpec.describe 'the merchant discount index', type: :feature do
  before(:each) do
    @merchant_1 = Merchant.create!(name: "A1")
    @merchant_2 = Merchant.create!(name: "B2")

    @employee_1 = @merchant_1.discounts.create!(percent: 28, quantity: 5)
    @flier_1 = @merchant_1.discounts.create!(percent: 10, quantity: 15)
    @tv_1 = @merchant_1.discounts.create!(percent: 15, quantity: 3)
    @promo_2 = @merchant_2.discounts.create!(percent: 12, quantity: 10)
    @single_2 = @merchant_2.discounts.create!(percent: 20, quantity: 1)
    @json = NagerService.new.three_holidays
  end

  it 'has a link to merchants dashboard' do
      visit "/merchants/#{@merchant_1.id}/discounts"
    expect(page).to have_link("Merchant Dashboard")
    click_link("Merchant Dashboard")
    expect(current_path).to eq("/merchants/#{@merchant_1.id}/dashboard")
  end

  it 'lists of all merchant discount percents, quantities' do
    visit "/merchants/#{@merchant_1.id}/discounts"

    within("#discount-index") do

      within("#discount-#{@employee_1.id}") do
        expect(page).to have_content(@employee_1.quantity)
        expect(page).to have_link(@employee_1.percent)
      end

      within("#discount-#{@flier_1.id}") do
        expect(page).to have_content(@flier_1.quantity)
        expect(page).to have_link(@flier_1.percent)
      end

      within ("#discount-#{@tv_1.id}") do
        expect(page).to have_content(@tv_1.quantity)
        expect(page).to have_link(@tv_1.percent)
      end

      click_link(@tv_1.percent)
      expect(current_path).to eq("/merchants/#{@merchant_1.id}/discounts/#{@tv_1.id}")
    end
  end


  it 'has link to delete merchant discount' do
    visit "/merchants/#{@merchant_1.id}/discounts"

    within("#discount-index") do
      within("#discount-#{@employee_1.id}") do
        expect(page).to have_content(@employee_1.quantity)
        expect(page).to have_link(@employee_1.percent)
          click_link("Delete")
        expect(current_path).to eq("/merchants/#{@merchant_1.id}/discounts")
      end

      visit "/merchants/#{@merchant_1.id}/discounts"
      expect(page).to_not have_link("%#{@employee_1.percent}")
    end
  end

  it 'has link to Create New Discount' do
    visit "/merchants/#{@merchant_1.id}/discounts"

    expect(page).to have_link("Create New Discount")
      click_link "Create New Discount"
    expect(current_path).to eq("/merchants/#{@merchant_1.id}/discounts/new")
  end

  describe 'Upcoming Holidays section' do
    it 'shows section for Upcoming Holidays' do
      visit "/merchants/#{@merchant_1.id}/discounts"

      within("#holidays") do
        expect(page).to have_content("Upcoming Holidays")
        expect(page).to have_content(@json[0][:name])
        expect(page).to have_content(@json[1][:name])
        expect(page).to have_content(@json[2][:name])
      end
    end
  end
end
