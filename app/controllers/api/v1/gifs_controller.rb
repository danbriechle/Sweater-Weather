class Api::V1::GifsController < ApplicationController
  def show
    render json: GifServiceFacade.new(params[:location])
  end
end
