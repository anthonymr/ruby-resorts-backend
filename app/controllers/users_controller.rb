class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 201
    else
      render json: { errors: @user.errors.full_messages }, status: 400
    end
  end

  def update
    if params[:password].present?
      if Current.user.update(user_update_params)
        render json: Current.user.attributes.except('password', 'password_digest'), status: 200
      else
        render json: { errors: Current.user.errors.full_messages }, status: 400
      end
      return
    end

    render json: { errors: 'Password can\'t be blank' }, status: 400
  end

  def destroy
    Current.user.destroy
  end

  private

  def user_params
    params.permit(:name, :username, :email, :password)
  end

  def user_update_params
    params.permit(:password)
  end
end
