require 'rails_helper'

RSpec.describe Room, type: :model do
  before(:each) do
    @room = Room.new(name: 'Example room', description: 'Example description', full_price: 100, reservation_price: 10,
                     reservation_fee: 10, rating: 5)
    @room.image.attach(
      io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test.png')),
      filename: 'test.png',
      content_type: 'image/png'
    )
  end

  it 'is valid with valid attributes' do
    expect(@room).to be_valid
  end

  it 'is not valid without a name' do
    @room.name = nil
    expect(@room).to_not be_valid
  end

  it 'is not valid without a description' do
    @room.description = nil
    expect(@room).to_not be_valid
  end

  it 'is not valid without a full_price' do
    @room.full_price = nil
    expect(@room).to_not be_valid
  end

  it 'is not valid without a reservation_price' do
    @room.reservation_price = nil
    expect(@room).to_not be_valid
  end

  it 'is not valid without a reservation_fee' do
    @room.reservation_fee = nil
    expect(@room).to_not be_valid
  end

  it 'is not valid without an image' do
    @room.image = nil
    expect(@room).to_not be_valid
  end

  it 'is not valid with a name longer than 55 characters' do
    @room.name = 'a' * 56
    expect(@room).to_not be_valid
  end

  it 'is not valid with a description longer than 55 characters' do
    @room.description = 'a' * 56
    expect(@room).to_not be_valid
  end

  it 'is not valid with a full_price less than or equal to 0' do
    @room.full_price = 0
    expect(@room).to_not be_valid
  end

  it 'is not valid with a reservation_price less than or equal to 0' do
    @room.reservation_price = 0
    expect(@room).to_not be_valid
  end

  it 'is not valid with a reservation_fee less than or equal to 0' do
    @room.reservation_fee = 0
    expect(@room).to_not be_valid
  end

  it 'is not valid with a rating less than 0' do
    @room.rating = -1
    expect(@room).to_not be_valid
  end

  it 'is not valid with a rating greater than 5' do
    @room.rating = 6
    expect(@room).to_not be_valid
  end
end
