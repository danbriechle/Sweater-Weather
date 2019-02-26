class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
    render json: {api_key: user.api_key}, status: 201
    else
    render json: {problem: "you did it not good"}, status: 404
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end

end
