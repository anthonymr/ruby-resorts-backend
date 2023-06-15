SWAGGER_HOTELS_ENDPOINTS = {
  get: { tags: ['🏨 Hotels'], security: [bearerAuth: []] }
}.freeze

SWAGGER_AUTHENTICATION_ENDPOINTS = {
  post: {
    tags: ['🔐 Authentication'],
    parameters: [
      { name: 'username', in: :query, type: :string, description: 'username', required: true },
      { name: 'password', in: :query, type: :string, description: 'password', required: true }
    ]
  },
  delete: { tags: ['🔐 Authentication'], security: [bearerAuth: []] },
  get: { tags: ['🔐 Authentication'], security: [bearerAuth: []] }
}.freeze

SWAGGER_RESERVATIONS_ENDPOINTS = {
  get: { tags: ['🗓️ Reservations'], security: [bearerAuth: []] },
  post: {
    tags: ['🗓️ Reservations'],
    security: [bearerAuth: []],
    parameters: [
      { name: 'hotel_id', in: :query, type: :string, description: 'hotel_id', required: true },
      { name: 'room_id', in: :query, type: :string, description: 'room_id', required: true },
      { name: 'start_date', in: :query, type: :string, description: 'start_date', required: true },
      { name: 'end_date', in: :query, type: :string, description: 'end_date', required: true }
    ]
  }
}.freeze

SWAGGER_RESERVATION_ENDPOINTS = {
  parameters: [{ name: 'id', in: :path, type: :string, description: 'id', required: true }],
  get: { tags: ['🗓️ Reservations'], security: [bearerAuth: []] },
  delete: { tags: ['🗓️ Reservations'], security: [bearerAuth: []] }
}.freeze

SWAGGER_ROOMS_ENDPOINTS = {
  get: { tags: ['🛌 Rooms'], security: [bearerAuth: []] },
  post: {
    tags: ['🛌 Rooms'],
    security: [bearerAuth: []],
    parameters: [
      { name: 'name', in: :query, type: :string, description: 'name', required: true },
      { name: 'description', in: :query, type: :string, description: 'description', required: true },
      { name: 'full_price', in: :query, type: :string, description: 'full_price', required: true },
      { name: 'reservation_price', in: :query, type: :string, description: 'reservation_price',
        required: true },
      { name: 'reservation_price', in: :query, type: :string, description: 'reservation_price',
        required: true },
      { name: 'reservation_fee', in: :query, type: :string, description: 'reservation_fee', required: true },
      { name: 'rating', in: :query, type: :string, description: 'rating' }
    ]
  }
}.freeze

SWAGGER_ROOM_ENDPOINTS = {
  parameters: [{ name: 'id', in: :path, type: :string, description: 'id', required: true }],
  get: { tags: ['🛌 Rooms'], security: [bearerAuth: []] },
  delete: { tags: ['🛌 Rooms'], security: [bearerAuth: []] }
}.freeze

SWAGGER_USERS_ENDPOINTS = {
  post: {
    tags: ['👥 Users'],
    parameters: [
      { name: 'name', in: :query, type: :string, description: 'name', required: true },
      { name: 'email', in: :query, type: :string, description: 'email', required: true },
      { name: 'username', in: :query, type: :string, description: 'username', required: true },
      { name: 'password', in: :query, type: :string, description: 'password', required: true }
    ]
  },
  patch: {
    tags: ['👥 Users'],
    security: [bearerAuth: []],
    parameters: [{ name: 'password', in: :query, type: :string, description: 'password', required: true }]
  }
}.freeze

SWAGGER_USER_ENDPOINTS = {
  parameters: [{ name: 'id', in: :path, type: :string, description: 'id', required: true }],
  delete: { tags: ['👥 Users'], security: [bearerAuth: []] }
}.freeze
