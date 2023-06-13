require 'rails_helper'

RSpec.describe Hotel, type: :model do
  before(:each) do
    @hotel = Hotel.new(name: 'Example hotel', city: 'Example city')
  end

  it 'is valid with valid attributes' do
    expect(@hotel).to be_valid
  end

  it 'is not valid without a name' do
    @hotel.name = nil
    expect(@hotel).to_not be_valid
  end

  it 'is not valid without a city' do
    @hotel.city = nil
    expect(@hotel).to_not be_valid
  end
end
