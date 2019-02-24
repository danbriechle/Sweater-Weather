class ForecastFacade
  attr_reader :forecast_hash
  def initialize(location)
     @forecast_hash = DarkSkyService.forecast_query(location)
  end
end
