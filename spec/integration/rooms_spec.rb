require 'rails_helper'

RSpec.describe 'Rooms', type: :request do
  before(:each) do
    @user = User.create(name: 'Example User', username: 'username', email: 'test@test.com', password: 'password')

    @user.update(role: 'admin')

    params = {
      username: 'username',
      password: 'password'
    }

    post(authentication_path, params:)

    @token = JSON.parse(response.body)['token']
  end

  describe 'POST /api/v1/rooms' do
    it 'create a room' do
      file = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'test.png'), 'image/jpg')
      file = Base64.encode64(file.read)

      params = {
        room: {
          name: 'Room 1',
          description: 'Room 1 description',
          full_price: 100,
          reservation_price: 10,
          reservation_fee: 10,
          rating: 5
        },
        image: file
      }

      post rooms_path, params:, headers: { Authorization: "Bearer #{@token}" }

      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /api/v1/rooms' do
    it 'delete a room' do
      file = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'test.png'), 'image/jpg')
      file = Base64.encode64(file.read)

      params = {
        room: {
          name: 'Room 1',
          description: 'Room 1 description',
          full_price: 100,
          reservation_price: 10,
          reservation_fee: 10,
          rating: 5
        },
        image: file
      }

      post rooms_path, params:, headers: { Authorization: "Bearer #{@token}" }

      delete room_path(Room.first), headers: { Authorization: "Bearer #{@token}" }

      expect(response).to have_http_status(:ok)
      expect(Room.count).to eq(Room.count)
    end
  end

  describe 'GET /api/v1/rooms' do
    it 'get all rooms' do
      file = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'test.png'), 'image/jpg')
      file = Base64.encode64(file.read)

      params = {
        room: {
          name: 'Room 1',
          description: 'Room 1 description',
          full_price: 100,
          reservation_price: 10,
          reservation_fee: 10,
          rating: 5
        },
        image: file
      }
      post rooms_path, params:, headers: { Authorization: "Bearer #{@token}" }

      get rooms_path, headers: { Authorization: "Bearer #{@token}" }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(Room.count)
    end
  end

  describe 'GET /api/v1/room/:id' do
    it 'get a room' do
      file = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'test.png'), 'image/jpg')
      file = Base64.encode64(file.read)

      params = {
        room: {
          name: 'Room 1',
          description: 'Room 1 description',
          full_price: 100,
          reservation_price: 10,
          reservation_fee: 10,
          rating: 5
        },
        image: file
      }

      post rooms_path, params:, headers: { Authorization: "Bearer #{@token}" }

      get room_path(Room.last), headers: { Authorization: "Bearer #{@token}" }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['name']).to eq('Room 1')
    end
  end
end
