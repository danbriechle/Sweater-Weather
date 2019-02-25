class Background
  def initialize(location)
    @image = image(location)
  end

  def image(location)
    BackgroundServiceFacade.new(location).image_hash
  end
end
