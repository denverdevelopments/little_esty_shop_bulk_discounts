require "rails_helper"

RSpec.describe NagerService do
  it 'has #three_holidays getting the next three holidays' do
      json = NagerService.new.three_holidays

    expect(json).to be_instance_of(Array)
  end
end
