class ForecastServiceFacade
  attr_reader :forecast_hash
  def initialize(location)
     @forecast_hash = DarkSkyService.forecast_query(location)
  end

  def self.by_lat_lng(lat, lng)
    binding.pry
    @forecast_hash = DarkSkyService.forecast_query_by_lat_lng(lat, lng)
  end
end
