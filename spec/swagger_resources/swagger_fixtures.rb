SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

def jwt_encode(payload, exp: 1.days.from_now)
  payload[:exp] = exp.to_i
  JWT.encode(payload, SECRET_KEY)
end

def test_user
  User.create(name: 'test', username: 'test1234567', email: 'test1234567@test.com', password: 'test1234567')
  user = User.find_by(username: 'test1234567')
  user.update(role: 'admin')
  Current.user = user
  user
end

def test_room
  room = Room.new(name: 'Example room', description: 'Example description', full_price: 100, reservation_price: 10,
                  reservation_fee: 10, rating: 5)
  room.image.attach(
    io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test.png')),
    filename: 'test.png',
    content_type: 'image/png'
  )
  room.save
  room
end

def test_hotel
  Hotel.create(name: 'test', city: 'test')
end

def test_reservation(hotel, room)
  reservation = Reservation.new_with_amount({ start_date: 1.days.from_now, end_date: 2.days.from_now, room_id: room.id,
                                              hotel_id: hotel.id })
  reservation.save
  reservation
end

def test_image
  image = Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'files', 'test.png'), 'image/jpg')
  Base64.encode64(image.read)
end

USER = test_user.freeze
ROOM = test_room.freeze
ROOM_TO_DELETE = test_room.freeze
HOTEL = test_hotel.freeze
RESERVATION = test_reservation(HOTEL, ROOM).freeze
RESERVATION_TO_DELETE = test_reservation(HOTEL, ROOM).freeze
TOKEN = "Bearer #{jwt_encode({ user_id: USER.id })}".freeze
BASE64_IMAGE = test_image.freeze
RANDOM = (0...10).map { ('a'..'z').to_a[rand(26)] }.join.freeze
