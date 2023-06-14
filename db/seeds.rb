# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.new(name: 'Example User', username: 'username', email: 'test@test.com', password: 'password')
user.update(role: 'admin')
user.save

hotel = Hotel.create(name: 'Hotel 1', city: 'City 1')

##first room
room1 = Room.new(name: 'Ruby', description: 'Ruby Suites offer the best we at Ruby Resorts have to offer. The suites come with 5-star amenities',
    full_price: 100, reservation_price: 10,
    reservation_fee: 10, rating: 5)
room1.image.attach(
io: File.open(Rails.root.join('db', 'fixtures', 'files', 'room1.jpg')),
filename: 'room1.jpg',
content_type: 'image/jpg'
)
room1.save

##second room
room2 = Room.new(name: 'Emerald', description: 'Emerald Suites are second only to our Ruby Suites when it comes to luxury. The suites come with 5-star amenities',
    full_price: 200, reservation_price: 20,
    reservation_fee: 10, rating: 4)
room2.image.attach(
io: File.open(Rails.root.join('db', 'fixtures', 'files', 'room2.jpg')),
filename: 'room2.jpg',
content_type: 'image/jpg'
)
room2.save

##third room
room3 = Room.new(name: 'Diamond', description: 'Diamond Suites strike the right balance between luxury and price. The suites have family-friendly amenities',
    full_price: 300, reservation_price: 10,
    reservation_fee: 10, rating: 4)
room3.image.attach(
io: File.open(Rails.root.join('db', 'fixtures', 'files', 'room3.jpg')),
filename: 'room3.jpg',
content_type: 'image/jpg'
)
room3.save

##fourth room
room4 = Room.new(name: 'Gold', description: 'Traveling for work or pleasure or both? Our Gold Executive suites offer amenities suited for your business trips.',
    full_price: 100, reservation_price: 10,
    reservation_fee: 10, rating: 5)
room4.image.attach(
io: File.open(Rails.root.join('db', 'fixtures', 'files', 'room4.jpg')),
filename: 'room4.jpg',
content_type: 'image/jpg'
)
room4.save

##fifth room

room5 = Room.new(name: 'Silver', description: 'Silver Family Suites are well-equipped to accommodate your family during your vacation or getaways. ',
    full_price: 100, reservation_price: 10,
    reservation_fee: 10, rating: 5)
room5.image.attach(
io: File.open(Rails.root.join('db', 'fixtures', 'files', 'room5.jpg')),
filename: 'room5.jpg',
content_type: 'image/jpg'
)
room5.save

reservation1 = Reservation.new(start_date: Date.today, end_date: Date.tomorrow, room_id: room1.id,
    user_id: user.id, hotel_id: hotel.id)
reservation1.save

reservation2 = Reservation.new(start_date: Date.today, end_date: Date.tomorrow, room_id: room3.id,
    user_id: user.id, hotel_id: hotel.id)
reservation2.save