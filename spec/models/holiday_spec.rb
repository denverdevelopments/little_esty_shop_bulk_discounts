require 'rails_helper'

RSpec.describe Holiday, type: :model do
  before(:each)do
    data = {
      date: "2021-07-05",
      name: "Independence Day"
      }
    @holiday = Holiday.new(data)
  end

  it 'exists, has name and date attributes' do
    expect(@holiday.instance_of? Holiday).to eq(true)
    expect(@holiday.nil?).to eq(false)
    expect(@holiday.name.class).to eq(String)
    expect(@holiday.date.class).to eq(String)
  end
end
