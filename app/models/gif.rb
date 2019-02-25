class Gif
  def initialize(city_state)
    @images = GifServiceFacade.new(city_state).gif_data_aray
  end
end
