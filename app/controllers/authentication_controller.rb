class AuthenticationController < ApplicationController
  skip_before_action :authenticate_user

  def create
    @user = User.find_by(username: params[:username])

    if @user&.authenticate(params[:password])
      token = jwt_encode({ user_id: @user.id })

      render json: { token: }, status: 200
    else
      render json: { errors: ['Invalid username or password'] }, status: 400
    end
  end

  def destroy
    @current_user&.update(jti: nil)
    render json: { status: 200, message: 'Logged out' }
  end
end
