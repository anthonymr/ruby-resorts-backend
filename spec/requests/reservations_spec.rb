require 'swagger_helper'

RSpec.describe 'reservations', type: :request do
  path '/api/v1/reservations' do
    get("List all current user's reservations") do
      consumes 'application/json'
      parameter name: :authorization, in: :header, type: :string, required: true
      let(:authorization) { TOKEN }
      response(200, 'successful') { run_test! }
    end

    post("Create new current user's reservation") do
      consumes 'application/json'
      parameter name: :authorization, in: :header, type: :string, required: true
      parameter name: :start_date, in: :query, type: :string, required: true
      parameter name: :end_date, in: :query, type: :string, required: true
      parameter name: :hotel_id, in: :query, type: :integer, required: true
      parameter name: :room_id, in: :query, type: :integer, required: true

      let(:authorization) { TOKEN }
      let(:start_date) { RESERVATION.start_date }
      let(:end_date) { RESERVATION.end_date }
      let(:hotel_id) { HOTEL.id }
      let(:room_id) { ROOM.id }
      response(201, 'successful') { run_test! }
    end
  end

  path '/api/v1/reservations/{id}' do
    get("Show a current user's reservation") do
      consumes 'application/json'
      parameter name: :authorization, in: :header, type: :string, required: true
      parameter name: :id, in: :path, type: :integer, required: true

      let(:authorization) { TOKEN }
      let(:id) { RESERVATION.id }
      response(200, 'successful') { run_test! }
    end

    delete("Delete a current user's reservation") do
      consumes 'application/json'
      parameter name: :authorization, in: :header, type: :string, required: true
      parameter name: :id, in: :path, type: :integer, required: true

      let(:authorization) { TOKEN }
      let(:id) { RESERVATION_TO_DELETE.id }
      response(200, 'successful') { run_test! }
    end
  end
end
