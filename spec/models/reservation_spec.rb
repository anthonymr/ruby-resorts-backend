require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before(:each) do
    @room = @room = Room.new(name: 'Example room', description: 'Example description', full_price: 100, reservation_price: 10,
      reservation_fee: 10, rating: 5)
    @room.image.attach(
    io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test.png')),
    filename: 'test.png',
    content_type: 'image/png'
    )
    @room.save
    @user = User.create(name: 'Example User', username: 'username', email: 'test@test.com', password: 'password')
    @hotel = Hotel.create(name: 'Example hotel', city: 'Example city')
    @reservation = Reservation.new(start_date: Date.today, end_date: Date.tomorrow, room_id: @room.id, user_id: @user.id, hotel_id: @hotel.id)
  end

  it 'is valid with valid attributes' do
    expect(@reservation).to be_valid
  end

  it 'is not valid without a start_date' do
    @reservation.start_date = nil
    expect(@reservation).to_not be_valid
  end

  it 'is not valid without an end_date' do
    @reservation.end_date = nil
    expect(@reservation).to_not be_valid
  end

  it 'is not valid without a room_id' do
    @reservation.room_id = nil
    expect(@reservation).to_not be_valid
  end

  it 'is not valid without a user_id' do
    @reservation.user_id = nil
    expect(@reservation).to_not be_valid
  end

  it 'calculates the correct amount' do
    expected_amount = (@reservation.end_date - @reservation.start_date).to_i * @room.reservation_price
    expect(@reservation.calculate_amount).to eq(expected_amount)
  end
end
