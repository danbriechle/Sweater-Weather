class Gif
  def initialize(city_state)
    @images = GifServiceFacade.new(city_state).images
  end
end
