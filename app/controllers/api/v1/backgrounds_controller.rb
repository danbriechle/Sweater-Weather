class Api::V1::BackgroundsController < ApplicationController
  def show
    render json: ImageFacade.new(params[:location])
  end
end
