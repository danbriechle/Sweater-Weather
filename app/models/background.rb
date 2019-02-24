class Background
  def initialize(location)
    @image = image(location)
  end

  def image(location)
    BackgroundFacade.new(location).image_hash
  end
end
