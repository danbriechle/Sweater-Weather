class Api::V1::ForecastsController < ApplicationController
  def show
    render json: {'weather' => 'weather'}
  end
end
