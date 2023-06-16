require 'swagger_helper'

RSpec.describe 'hotels', type: :request do
  path '/api/v1/hotels' do
    get('List all hotels') { response(200, 'successful') { run_test! } }
  end
end
