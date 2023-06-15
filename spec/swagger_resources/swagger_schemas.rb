SWAGGER_HOTEL_SCHEMA = {
  type: :object,
  properties: {
    id: { type: :number, example: '1', description: 'Auto generated' },
    name: { type: :string, example: 'Jhon Doe', description: 'Max length: 55 chars' },
    city: { type: :string, example: 'New York', description: 'Max length: 55 chars' }
  },
  required: %w[name city]
}.freeze

SWAGGER_ROOM_SCHEMA = {
  type: :object,
  properties: {
    id: { type: :number, example: '1', description: 'Auto generated' },
    name: { type: :string, example: 'New room name', description: 'Max length: 55 chars' },
    description: { type: :string, example: 'New room description', description: 'Max length: 550 chars' },
    full_price: { type: :number, example: 100, description: 'Full room price per day' },
    reservation_price: { type: :number, example: 50, description: 'Reservation price per day' },
    reservation_fee: { type: :number, example: 10, description: 'Reservation fee per day' },
    rating: { type: :number, example: 4, description: 'Rating from 1 to 5' },
    image: { type: :string, description: 'Base64 image' }
  },
  required: %w[name description full_price reservation_price reservation_fee image]
}.freeze

SWAGGER_USER_SCHEMA = {
  type: :object,
  properties: {
    id: { type: :number, example: '1', description: 'Auto generated' },
    name: { type: :string, example: 'Jhon Doe', description: 'Max length: 55 chars' },
    email: { type: :string, example: 'jhondoe@email.com', description: 'Max length: 55 chars, has to be unique.' },
    password: { type: :string, example: '123456', description: 'Max length: 55 chars' },
    username: { type: :string, example: 'jhondoe', description: 'Max length: 55 chars, has to be unique.' }
  },
  required: %w[name email password username]
}.freeze

SWAGGER_RESERVATION_SCHEMA = {
  type: :object,
  properties: {
    id: { type: :number, example: '1', description: 'Auto generated' },
    user_id: { type: :number, example: '1', description: 'Auto assigned' },
    room_id: { type: :number, example: '1', description: 'Room ID' },
    start_date: { type: :string, example: '2020-01-01', description: 'Format: YYYY-MM-DD' },
    end_date: { type: :string, example: '2020-01-01', description: 'Format: YYYY-MM-DD' },
    amount: { type: :number, example: 100, description: 'Auto calculated' }
  },
  required: %w[room_id start_date end_date amount]
}.freeze
