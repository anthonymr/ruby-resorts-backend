require 'swagger_helper'

RSpec.describe 'reservations', type: :request do
  path '/api/v1/reservations' do
    get("List all current user's reservations") { response(200, 'successful') { run_test! } }
    post("Create new current user's reservation") { response(200, 'successful') { run_test! } }
  end

  path '/api/v1/reservations/{id}' do
    get("Show a current user's reservation") { response(200, 'successful') { run_test! } }
    delete("Delete a current user's reservation") { response(200, 'successful') { run_test! } }
  end
end
