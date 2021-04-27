require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to(:merchant) }
    it { should have_many(:invoice_items) }
    it { should have_many(:invoices).through(:invoice_items) }

  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:unit_price) }
    it { should validate_numericality_of(:unit_price) }
    it { should validate_presence_of(:able) }

  end

  before(:each) do
    @merchant1 = Merchant.create!(name: "CCC")
    @item1 = @merchant1.items.create!(name: "it1", description: "thing", unit_price: 10, able: "Disabled")
    @item2 = @merchant1.items.create!(name: "it2", description: "thing", unit_price: 20, able: "Enabled")
    @item3 = @merchant1.items.create!(name: "it3", description: "thing", unit_price: 30, able: "Enabled")
    @item4 = @merchant1.items.create!(name: "it4", description: "thing", unit_price: 40, able: "Disabled")
    @item5 = @merchant1.items.create!(name: "it5", description: "thing", unit_price: 50, able: "Disabled")
  end

  describe 'class methods' do
    describe 'enabled' do
      it 'shows only items with enabled status' do
        expect(@merchant1.items.enabled).to eq([@item2, @item3])
      end
    end

    describe 'disabled' do
      it 'shows only items with disabled status' do
        expect(@merchant1.items.disabled).to eq([@item1, @item4, @item5])
      end
    end

    describe 'top_five_items' do
      it 'shows the top 5 items by revenue' do

      end
    end
  end

  describe 'instance methods' do
    describe 'item_best_day' do
      it 'shows date with most sales for item' do

      end
    end
  end
end
