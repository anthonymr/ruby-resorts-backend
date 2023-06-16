require 'swagger_helper'

RSpec.describe 'rooms', type: :request do
  path '/api/v1/rooms' do
    get('List all rooms') do
      response(200, 'successful') { run_test! }
    end

    post('Create a new room') do
      response(200, 'successful') { run_test! }
    end
  end

  path '/api/v1/rooms/{id}' do
    get('Show a room') do
      response(200, 'successful') { run_test! }
    end

    delete('Delete a room') do
      response(200, 'successful') { run_test! }
    end
  end
end
