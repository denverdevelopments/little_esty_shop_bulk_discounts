require 'rails_helper'

<<<<<<< HEAD
describe 'Admin Merchant Show' do
  before :each do
    @m1 = Merchant.create!(name: 'Merchant 1')
    visit admin_merchant_path(@m1)
  end

  it 'should have merchant name' do
    expect(page).to have_content(@m1.name)
  end

  it 'should have a link to update merchant' do
    expect(page).to have_link('Update Merchant')

    click_link 'Update Merchant'

    expect(current_path).to eq(edit_admin_merchant_path(@m1))
  end

  it 'should display updated information' do
    visit edit_admin_merchant_path(@m1)

    fill_in 'merchant[name]', with: 'Dang Boiii'

    click_button

    expect(current_path).to eq(admin_merchant_path(@m1))
    expect(page).to have_content('Dang Boiii')
  end
end
=======
RSpec.describe 'admin merchant show page', type: :feature do
  it 'has the name of the merchant' do
    merchant1 = Merchant.create!(name: "Abe")
    
    visit "/admin/merchants/#{merchant1.id}"
    
    expect(page).to have_content(merchant1.name)
  end
  
  it 'has a link to update the merchants attributes' do
    merchant1 = Merchant.create!(name: "Abe")

    visit "/admin/merchants/#{merchant1.id}"
    
    expect(page).to have_link("Update")
    click_link "Update"
    expect(current_path).to eq("/admin/merchants/#{merchant1.id}/edit")
  end
end
>>>>>>> bulk
