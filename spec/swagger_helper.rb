require 'rails_helper'
require_relative './swagger_resources/swagger_info'
require_relative './swagger_resources/swagger_servers'
require_relative './swagger_resources/swagger_endpoints'
require_relative './swagger_resources/swagger_tags'
require_relative './swagger_resources/swagger_components'

RSpec.configure do |config|
  config.swagger_root = Rails.root.join('swagger').to_s

  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: SWAGGER_INFO,
      components: SWAGGER_COMPONENTS,
      servers: SWAGGER_SERVERS,
      tags: SWAGGER_TAGS,
      paths: {
        '/api/v1/authentication' => SWAGGER_AUTHENTICATION_ENDPOINTS,
        '/api/v1/users' => SWAGGER_USERS_ENDPOINTS,
        '/api/v1/users/{id}' => SWAGGER_USER_ENDPOINTS,
        '/api/v1/hotels' => SWAGGER_HOTELS_ENDPOINTS,
        '/api/v1/rooms' => SWAGGER_ROOMS_ENDPOINTS,
        '/api/v1/rooms/{id}' => SWAGGER_ROOM_ENDPOINTS,
        '/api/v1/reservations' => SWAGGER_RESERVATIONS_ENDPOINTS,
        '/api/v1/reservations/{id}' => SWAGGER_RESERVATION_ENDPOINTS
      }
    }
  }

  config.swagger_format = :yaml
end
