require 'swagger_helper'

RSpec.describe 'authentication', type: :request do
  path '/api/v1/authentication' do
    post('Authenticate user and return token') do
      consumes 'application/json'
      parameter name: :username, in: :query, type: :string, required: true
      parameter name: :password, in: :query, type: :string, required: true
      let(:username) { 'test1234567' }
      let(:password) { 'test1234567' }

      response(200, 'successful') { run_test! }
    end

    delete('Destroy current session') do
      consumes 'application/json'
      parameter name: :authorization, in: :header, type: :string, required: true
      let(:authorization) { TOKEN }
      response(200, 'successful') { run_test! }
    end

    get('Show information about current authenticated user') do
      consumes 'application/json'
      parameter name: :authorization, in: :header, type: :string, required: true
      let(:authorization) { TOKEN }
      response(200, 'successful') { run_test! }
    end
  end
end
