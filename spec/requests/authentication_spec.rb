require 'rails_helper'

RSpec.describe 'Authentications', type: :request do
  before(:each) do
    @user = User.create(name: 'Example User', username: 'username', email: 'test@test.com', password: 'password')

    params = {
      username: 'username',
      password: 'password'
    }

    post(authentication_path, params:)

    @token = JSON.parse(response.body)['token']
  end

  describe 'POST /api/v1/authentication' do
    it 'authenticates a user' do
      expect(@token).not_to be_nil
    end
  end

  describe 'DELETE /api/v1/authentication' do
    it 'deletes a user session' do
      delete authentication_path, headers: { Authorization: "Bearer #{@token}" }
      expect(response).to have_http_status :ok
    end
  end

  describe 'GET /api/v1/authentication' do
    it 'gets logged user information' do
      get authentication_path, headers: { Authorization: "Bearer #{@token}" }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['username']).to eq('username')
    end
  end
end
