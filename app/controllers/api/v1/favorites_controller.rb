class Api::V1::FavoritesController < ApplicationController

  def index
    user = User.find_by(api_key: params[:api_key])
    if user
      render json: FavoritesPresenter.new(user.id).favorites
    else
      render json: {problem: "you did it not good"}, status: 401
    end
  end

  def create
    user = User.find_by(api_key: params[:api_key])
    if user && params[:location]
      user.favorites.create!(location: params[:location])
      render json: {message: "#{params[:location]} added to favorites"}, status: 200
    else
      render json: {problem: "you did it not good"}, status: 401
    end
  end

  def delete
    user_favs = User.find_by(api_key: params[:api_key]).favorites
    if user_favs && params[:location]
      user_favs.find_by(location: params[:location]).destroy
      render json: FavoritesPresenter.deleted_favorites_factory(params[:location])
    else
      render json: {problem: "you did it not good"}, status: 401
    end
  end

end
