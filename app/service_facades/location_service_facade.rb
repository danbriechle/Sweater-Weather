class LocationServiceFacade
  attr_reader :lat, :lng
  def initialize(location)
    @lat = GoogleGeocodeService.lat(location)
    @lng = GoogleGeocodeService.lng(location)
  end
end
