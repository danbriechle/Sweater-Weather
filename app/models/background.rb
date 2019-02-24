class Background
  def initialize(location)
    @location = location
    @image = self.image

  end

  def image
    FlickrService.photo_url(@location)
  end
end
