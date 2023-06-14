require 'rails_helper'

RSpec.describe "Hotels", type: :request do
  before(:each) do
    @user = User.create(name: 'Example User', username: 'username', email: 'user@gmail.com', password: 'password', role: 'admin')
    params = { username: 'username', password: 'password' }
    post(authentication_path, params: params)
    @token = JSON.parse(response.body)['token']
  end

  describe "GET /api/v1/hotels" do
    before(:each) do
      @headers = { 'Authorization': "Bearer #{@token}" }
    end

    it "returns a successful response" do
      get "/api/v1/hotels", headers: @headers
      expect(response).to have_http_status(200)
    end

    it "returns all hotels in JSON format" do
      # Create some sample hotels for testing
      hotel1 = Hotel.create(name: "Hotel 1", city: "City 1")
      hotel2 = Hotel.create(name: "Hotel 2", city: "City 2")

      get "/api/v1/hotels", headers: @headers
      
      # Convert the response body to JSON for easier comparison
      hotels_json = JSON.parse(response.body)
      
      expect(response).to have_http_status(200)
      expect(hotels_json).to be_an(Array)
      expect(hotels_json.length).to eq(2)
      expect(hotels_json[0]["name"]).to eq(hotel1.name)
      expect(hotels_json[0]["city"]).to eq(hotel1.city)
      expect(hotels_json[1]["name"]).to eq(hotel2.name)
      expect(hotels_json[1]["city"]).to eq(hotel2.city)
    end
  end
end
