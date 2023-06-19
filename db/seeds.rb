# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails app:seed command (or created alongside the database with app:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def create_room(room_params, image)
    room = Room.new(room_params)
    room.image.attach(
        io: File.open(Rails.root.join('app', 'assets', 'images', image)),
        filename: image,
        content_type: 'image/jpeg'
    )
    room.save
end

User.where(email: 'test@test.com').or(User.where(username: 'admin')).destroy_all
user = User.new(name: 'Example User', username: 'admin', email: 'test@test.com', password: 'admin123')
user.role = 'admin'
user.save

Hotel.destroy_all

Hotel.create(name: 'Ruby Amsterdam', city: 'Amsterdam')
Hotel.create(name: 'Ruby Valencia', city: 'Valencia')
Hotel.create(name: 'Ruby Vienna', city: 'Vienna')
Hotel.create(name: 'Ruby Barcelona', city: 'Barcelona')
Hotel.create(name: 'Ruby Marseille', city: 'Marseille')
Hotel.create(name: 'Ruby Sevilla', city: 'Sevilla')
Hotel.create(name: 'Ruby Sylt', city: 'Sylt')

Room.destroy_all

# first room
create_room({
    name: 'Ruby',
    description: 'Ruby Suites offer the best we at Ruby Resorts have to offer. The suites come with 5-star amenities',
    full_price: 100,
    reservation_price: 10,
    reservation_fee: 10,
    rating: 5
}, 'room1.jpg')

# second room
create_room({
    name: 'Emerald',
    description: 'Emerald Suites are second only to our Ruby Suites when it comes to luxury. The suites come with 5-star amenities',
    full_price: 200,
    reservation_price: 20,
    reservation_fee: 10,
    rating: 4
}, 'room2.jpg')

# third room
create_room({
    name: 'Diamond',
    description: 'Diamond Suites strike the right balance between luxury and price. The suites have family-friendly amenities',
    full_price: 300,
    reservation_price: 10,
    reservation_fee: 10,
    rating: 4
}, 'room3.jpg')

# fourth room
create_room({
    name: 'Gold',
    description: 'Traveling for work or pleasure or both? Our Gold Executive suites offer amenities suited for your business trips.',
    full_price: 100,
    reservation_price: 10,
    reservation_fee: 10,
    rating: 5
}, 'room4.jpg')

# fifth room

create_room({
    name: 'Silver',
    description: 'Silver Family Suites are well-equipped to accommodate your family during your vacation or getaways. ',
    full_price: 100,
    reservation_price: 10,
    reservation_fee: 10,
    rating: 5
}, 'room5.jpg')
