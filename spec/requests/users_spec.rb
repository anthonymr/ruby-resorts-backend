require 'rails_helper'
require 'jwt'

RSpec.describe 'Users', type: :request do
  before(:each) do
    @user = User.create(name: 'Example User', username: 'username', email: 'test@test.com', password: 'password')
    @user&.authenticate('password')
    @token = JWT.encode({ user_id: @user.id }, Rails.application.secrets.secret_key_base.to_s)
  end

  describe 'POST /api/v1/users' do
    it 'creates a new user' do
      params = {
        name: 'Example User', username: 'username2', email: 'test2@test.com', password: 'password'
      }

      post(users_path, params:)

      expect(response).to have_http_status :created
    end
  end

  describe 'PATCH /api/v1/users' do
    it 'updates current user password' do
      params = {
        password: 'new_password'
      }

      patch users_path, params:, headers: { Authorization: "Bearer #{@token}" }

      expect(response).to have_http_status :ok
    end
  end
end
