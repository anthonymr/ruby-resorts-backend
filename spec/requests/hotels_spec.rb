require 'swagger_helper'

RSpec.describe 'hotels', type: :request do
  path '/api/v1/hotels' do
    get('List all hotels') do
      consumes 'application/json'
      parameter name: :authorization, in: :header, type: :string, required: true
      let(:authorization) { TOKEN }
      response(200, 'successful') { run_test! }
    end
  end
end
