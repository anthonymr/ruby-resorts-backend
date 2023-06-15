require 'rails_helper'

info = {
  title: '💎 Ruby Restors API V1',
  version: '1.0.0',
  description: 'Ruby Restors API V1 endpoints'
}

components = {
  securitySchemes: {
    bearerAuth: {
      description: 'JWT Token for authentication, prefix it with Bearer',
      type: :apiKey,
      name: 'Authorization',
      in: :header
    }
  }
}

servers = [
  {
    url: 'http://{defaultHost}',
    variables: {
      defaultHost: {
        default: 'localhost:3000'
      }
    }
  },
  {
    url: 'https://{defaultHost}',
    variables: {
      defaultHost: {
        default: 'localhost:3000'
      }
    }
  }
]

hotels_endpoints = {
  get: { tags: ['🏨 Hotels'], security: [bearerAuth: []] }
}

authentication_endpoints = {
  post: {
    tags: ['🔐 Authentication'],
    parameters: [
      { name: 'username', in: :query, type: :string, description: 'username', required: true },
      { name: 'password', in: :query, type: :string, description: 'password', required: true }
    ]
  },
  delete: { tags: ['🔐 Authentication'], security: [bearerAuth: []] },
  get: { tags: ['🔐 Authentication'], security: [bearerAuth: []] }
}

reservations_endpoints = {
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
}

reservation_endpoints = {
  parameters: [{ name: 'id', in: :path, type: :string, description: 'id', required: true }],
  get: { tags: ['🗓️ Reservations'], security: [bearerAuth: []] },
  delete: { tags: ['🗓️ Reservations'], security: [bearerAuth: []] }
}

rooms_endpoints = {
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
}

room_endpoints = {
  parameters: [{ name: 'id', in: :path, type: :string, description: 'id', required: true }],
  get: { tags: ['🛌 Rooms'], security: [bearerAuth: []] },
  delete: { tags: ['🛌 Rooms'], security: [bearerAuth: []] }
}

users_endpoints = {
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
}

user_endpoints = {
  parameters: [{ name: 'id', in: :path, type: :string, description: 'id', required: true }],
  delete: { tags: ['👥 Users'], security: [bearerAuth: []] }
}

RSpec.configure do |config|
  config.swagger_root = Rails.root.join('swagger').to_s

  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info:,
      components:,
      servers:,
      paths: {
        '/api/v1/hotels' => hotels_endpoints,
        '/api/v1/authentication' => authentication_endpoints,
        '/api/v1/reservations' => reservations_endpoints,
        '/api/v1/reservations/{id}' => reservation_endpoints,
        '/api/v1/rooms' => rooms_endpoints,
        '/api/v1/rooms/{id}' => room_endpoints,
        '/api/v1/users' => users_endpoints,
        '/api/v1/users/{id}' => user_endpoints
      }
    }
  }

  config.swagger_format = :yaml
end
