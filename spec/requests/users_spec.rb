require 'swagger_helper'

RSpec.describe 'users', type: :request do
  path '/api/v1/users' do
    post('Create a new user') { response(200, 'successful') { run_test! } }
    patch("Change current user's password") { response(200, 'successful') { run_test! } }
  end

  path '/api/v1/users/{id}' do
    delete('Delete a user') { response(200, 'successful') { run_test! } }
  end
end
