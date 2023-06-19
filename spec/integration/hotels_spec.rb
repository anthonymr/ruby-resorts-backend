require 'rails_helper'

RSpec.describe 'Hotels', type: :request do
  before(:each) do
    @user = User.create(name: 'Example User', username: 'username', email: 'user@gmail.com', password: 'password',
                        role: 'admin')
    params = { username: 'username', password: 'password' }
    post(authentication_path, params:)
    @token = JSON.parse(response.body)['token']
  end

  describe 'GET /api/v1/hotels' do
    before(:each) do
      @headers = { Authorization: "Bearer #{@token}" }
    end

    it 'returns a successful response' do
      get '/api/v1/hotels', headers: @headers
      expect(response).to have_http_status(200)
    end

    it 'returns all hotels in JSON format' do
      Hotel.create(name: 'Hotel 1', city: 'City 1')
      Hotel.create(name: 'Hotel 2', city: 'City 2')

      get '/api/v1/hotels', headers: @headers
      hotels_json = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(hotels_json).to be_an(Array)
      expect(hotels_json.length).to eq(Hotel.count)
    end
  end
end
