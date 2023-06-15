require_relative './swagger_schemas'

SWAGGER_COMPONENTS = {
  securitySchemes: {
    bearerAuth: {
      description: 'JWT Token for authentication, prefix it with Bearer',
      type: :apiKey,
      name: 'Authorization',
      in: :header
    }
  },
  schemas: {
    user: SWAGGER_USER_SCHEMA,
    hotel: SWAGGER_HOTEL_SCHEMA,
    room: SWAGGER_ROOM_SCHEMA,
    reservation: SWAGGER_RESERVATION_SCHEMA
  }
}.freeze
