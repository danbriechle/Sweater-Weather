class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
    render json: {api_key: user.api_key}, status: 200
    else
    render json: {problem: "you did it not good"}, status: 404
    end
  end

end
