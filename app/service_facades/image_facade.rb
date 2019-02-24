class ImageFacade
  def initialize(location)
    @image = FlickrService.photo_url(location)
  end
end
