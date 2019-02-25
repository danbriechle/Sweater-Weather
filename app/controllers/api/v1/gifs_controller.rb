class Api::V1::GifsController < ApplicationController
  def show
    render json: Gif.new(params[:location])
  end
end
