require 'swagger_helper'

RSpec.describe 'authentication', type: :request do
  path '/api/v1/authentication' do
    post('Authenticate user and return token') { response(200, 'successful') { run_test! } }
    delete('Destroy current session') { response(200, 'successful') { run_test! } }
    get('Show information about current authenticated user') { response(200, 'successful') { run_test! } }
  end
end
