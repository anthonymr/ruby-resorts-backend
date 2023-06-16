require 'swagger_helper'

RSpec.describe 'rooms', type: :request do
  path '/api/v1/rooms' do
    get('List all rooms') do
      consumes 'application/json'
      parameter name: :authorization, in: :header, type: :string, required: true
      let(:authorization) { TOKEN }
      response(200, 'successful') { run_test! }
    end

    post('Create a new room') do
      consumes 'application/json'
      parameter name: :authorization, in: :header, type: :string, required: true
      parameter name: :'room[name]', in: :query, type: :string, required: true
      parameter name: :'room[description]', in: :query, type: :string, required: true
      parameter name: :'room[full_price]', in: :query, type: :integer, required: true
      parameter name: :'room[reservation_price]', in: :query, type: :integer, required: true
      parameter name: :'room[reservation_fee]', in: :query, type: :integer, required: true
      parameter name: :'room[rating]', in: :query, type: :integer, required: true
      parameter name: :image, in: :query, type: :string, required: true

      let(:authorization) { TOKEN }
      let(:'room[name]') { ROOM.name }
      let(:'room[description]') { ROOM.description }
      let(:'room[full_price]') { ROOM.full_price }
      let(:'room[reservation_price]') { ROOM.reservation_price }
      let(:'room[reservation_fee]') { ROOM.reservation_fee }
      let(:'room[rating]') { ROOM.rating }
      let(:image) { BASE64_IMAGE }
      response(201, 'successful') { run_test! }
    end
  end

  path '/api/v1/rooms/{id}' do
    get('Show a room') do
      consumes 'application/json'
      parameter name: :authorization, in: :header, type: :string, required: true
      parameter name: :id, in: :path, type: :integer, required: true

      let(:authorization) { TOKEN }
      let(:id) { ROOM.id }
      response(200, 'successful') { run_test! }
    end

    delete('Delete a room') do
      consumes 'application/json'
      parameter name: :authorization, in: :header, type: :string, required: true
      parameter name: :id, in: :path, type: :integer, required: true

      let(:authorization) { TOKEN }
      let(:id) { ROOM_TO_DELETE.id }
      response(200, 'successful') { run_test! }
    end
  end
end
