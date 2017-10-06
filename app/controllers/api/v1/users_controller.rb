class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user, only: %i[show update auth]

  def show
    render json: current_user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: { user: user }
    else
      render json: { errors: user.errors }
    end
  end

  def update
    if current_user.update(avatar)
      render json: { user: current_user }
    else
      render json: { errors: current_user.errors }
    end
  end

  def auth
    render json: current_user
  end

  private

  def user_params
    params.permit(:nickname, :email, :password)
  end

  def avatar
    params.permit(:avatar)
  end
end
