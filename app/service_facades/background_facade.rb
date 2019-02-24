class BackgroundFacade
  attr_reader :image_hash
  def initialize(location)
    @image_hash= FlickrService.photo_url(location)
  end
end
