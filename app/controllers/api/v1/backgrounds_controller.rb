class Api::V1::BackgroundsController < ApplicationController
  def show
    render json: Background.new(params[:location])
  end
end
