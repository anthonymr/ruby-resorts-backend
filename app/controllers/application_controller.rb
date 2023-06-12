class ApplicationController < ActionController::API
  include JwtToken

  before_action :authenticate_user

  def forbidden
    render json: { errors: ['Not authorized'] }, status: 403
  end

  def not_found(item)
    render json: { errors: ["#{item} not found"] }, status: 404
  end

  private

  def authenticate_user
    header = request.headers['Authorization']
    header = header.split.last if header

    begin
      @decoded = jwt_decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound, JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
