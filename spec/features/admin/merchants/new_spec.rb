require 'rails_helper'

<<<<<<< HEAD
describe 'Admin Merchant New' do
  before :each do
    @m1 = Merchant.create!(name: 'Merchant 1')
  end
  
  it 'should be able to fill in a form and create a new merchant' do
    visit new_admin_merchant_path

    fill_in :name, with: 'Dingley Doo'

    click_button

    expect(current_path).to eq(admin_merchants_path)
    expect(page).to have_content('Dingley Doo')
    expect(page).to have_content('Merchant Has Been Created!')
=======
RSpec.describe 'admin new merchant page', type: :feature do
  it 'shows the new merchant form' do

    visit "/admin/merchants/new"
    
    expect(find('form')).to have_content('Name')
    expect(find('form')).to have_content('Status')
    expect(find('form')).to have_button('Create Merchant')
  end
  describe 'happy path' do
    it 'creates a new merchant with a default status of disabled' do

      visit "/admin/merchants/new"
      
      fill_in "Name", with: "Very Good Building Co"
      click_button "Create Merchant"
      expect(current_path).to eq("/admin/merchants")
      within("#disabled_merchants") do
        expect(page).to have_content("Very Good Building Co")
      end
    end
  end
  
  describe 'sad path' do
    it 'does not allow user to create a merchant with no name' do
      visit "/admin/merchants/new"
      click_button "Create Merchant"
      expect(current_path).to eq("/admin/merchants/new")
      expect(page).to have_content("Name can't be blank")
    end
    
    it 'does not allow a user to create a merchant with an invalid status' do
      visit "/admin/merchants/new"
      fill_in "Name", with: "Very Good Building Co"
      fill_in "Status", with: "pending"
      click_button "Create Merchant"
      expect(current_path).to eq("/admin/merchants/new")
      expect(page).to have_content('Invalid Status')
    end
    
    it 'does not allow a user to create a merchant with a blank status' do
      visit "/admin/merchants/new"
      fill_in "Name", with: "Very Good Building Co"
      fill_in "Status", with: ""
      click_button "Create Merchant"
      expect(current_path).to eq("/admin/merchants/new")
      expect(page).to have_content('Invalid Status')
    end
>>>>>>> bulk
  end
end
