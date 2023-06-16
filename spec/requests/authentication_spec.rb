require 'swagger_helper'

RSpec.describe 'authentication', type: :request do
  path '/api/v1/authentication' do
    before do
      User.create(name: 'test', username: 'test1234567', email: 'test1234567@test.com', password: 'test1234567')
    end

    post('Authenticate user and return token') do
      consumes 'application/json'
      parameter name: :username, in: :query, type: :string, required: true
      parameter name: :password, in: :query, type: :string, required: true

      response(200, 'successful') do
        let(:username) { 'test1234567' }
        let(:password) { 'test1234567' }
        run_test!
      end
    end
    delete('Destroy current session') { response(200, 'successful') { run_test! } }
    get('Show information about current authenticated user') { response(200, 'successful') { run_test! } }
  end
end
