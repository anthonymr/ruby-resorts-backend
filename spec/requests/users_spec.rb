require 'swagger_helper'

RSpec.describe 'users', type: :request do
  path '/api/v1/users' do
    post('Create a new user') do
      consumes 'application/json'
      parameter name: :name, in: :query, type: :string, required: true
      parameter name: :username, in: :query, type: :string, required: true
      parameter name: :password, in: :query, type: :string, required: true
      parameter name: :email, in: :query, type: :string, required: true

      let(:username) { RANDOM }
      let(:password) { RANDOM }
      let(:name) { RANDOM }
      let(:email) { "#{RANDOM}@test.com" }
      response(201, 'successful') { run_test! }
    end
    patch("Change current user's password") do
      consumes 'application/json'
      parameter name: :authorization, in: :header, type: :string, required: true
      parameter name: :password, in: :query, type: :string, required: true

      let(:authorization) { TOKEN }
      let(:password) { 'new_password' }
      response(200, 'successful') { run_test! }
    end
  end

  path '/api/v1/users/{id}' do
    delete('Delete a user') do
      consumes 'application/json'
      parameter name: :authorization, in: :header, type: :string, required: true
      parameter name: :id, in: :path, type: :string, required: true

      let(:authorization) { TOKEN }
      let(:id) { USER.id }
      response(204, 'successful') { run_test! }
    end
  end
end
