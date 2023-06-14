require 'rails_helper'

RSpec.describe 'Reservations', type: :request do
  before(:each) do
    @user = User.create(name: 'Example User', username: 'username', email: 'user@gmail.com', password: 'password', role: 'admin')
    @user.update(role: 'admin')
    params = { username: 'username', password: 'password' }
    post(authentication_path, params: params)
    @token = JSON.parse(response.body)['token']

    @hotel = Hotel.create(name: "Hotel 1", city: "City 1")

    @room = Room.new(name: 'Example room', description: 'Example description',
      full_price: 100, reservation_price: 10,
      reservation_fee: 10, rating: 5)
    @room.image.attach(
      io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test.png')),
      filename: 'test.png',
      content_type: 'image/png'
    )
    @room.save

    @reservation = Reservation.new(start_date: Date.today, end_date: Date.tomorrow, room_id: @room.id, user_id: @user.id, hotel_id: @hotel.id)
    @reservation.save
  end

  describe 'GET /api/v1/reservations' do
    it "returns a successful response" do
      get "/api/v1/reservations", headers: { 'Authorization' => "Bearer #{@token}" }
      expect(response).to have_http_status(200)
    end

    it "returns all reservations in JSON format" do
      # Create some sample reservations for testing
      reservation1 = Reservation.create(start_date: Date.today, end_date: Date.tomorrow)
      reservation2 = Reservation.create(start_date: Date.yesterday, end_date: Date.today)

      get "/api/v1/reservations", headers: { 'Authorization' => "Bearer #{@token}" }
      reservations_json = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(reservations_json).to be_an(Array)
      expect(reservations_json.length).to eq(1)
    end
  end

  describe "GET /api/v1/reservations/:id" do
    it "returns a specific reservation" do
      reservation = Reservation.create(start_date: Date.today, end_date: Date.tomorrow)

      get "/api/v1/reservations/#{reservation.id}", headers: { 'Authorization' => "Bearer #{@token}" }
      reservation_json = JSON.parse(response.body)
      reservation_hash = reservation_json.first # Assuming only one reservation is returned

      expect(response).to have_http_status(200)
      expect(reservation_hash).to be_a(Hash)
      expect(reservation_hash["id"]).to eq(@reservation.id)
    end

    it "returns a not found error for invalid reservation" do
      get "/api/v1/reservations/9999", headers: { 'Authorization' => "Bearer #{@token}" }
      expect(response).to have_http_status(404)
    end
  end

  describe "POST /api/v1/reservations" do
    it "creates a new reservation with valid parameters" do
      valid_params = {
        start_date: Date.today,
        end_date: Date.tomorrow,
        user_id: @user.id,
        hotel_id: @hotel.id,
        room_id: @room.id
      }

      post "/api/v1/reservations", params: valid_params, headers: { 'Authorization' => "Bearer #{@token}" }

      expect(response).to have_http_status(201)
      expect(Reservation.count).to eq(2)
    end

    it "returns an error for invalid parameters" do
      invalid_params = {
        start_date: nil,
        end_date: nil,
        user_id: nil,
        hotel_id: nil,
        room_id: nil
      }

      post "/api/v1/reservations", params: invalid_params, headers: { 'Authorization' => "Bearer #{@token}" }

      expect(response).to have_http_status(422)
      expect(Reservation.count).to eq(1)
    end
  end

  describe "DELETE /api/v1/reservations/:id" do
    it "deletes a specific reservation" do
      # reservation = Reservation.create(start_date: Date.today, end_date: Date.tomorrow)

      delete "/api/v1/reservations/#{@reservation.id}", headers: { 'Authorization' => "Bearer #{@token}" }

      expect(response).to have_http_status(200)
      expect(Reservation.count).to eq(0)
    end
  end
end
