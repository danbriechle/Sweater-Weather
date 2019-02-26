class ForecastServiceFacade
  attr_reader :forecast_hash
  def initialize(location)
     @forecast_hash = DarkSkyService.forecast_query(location)
  end

  def self.by_lat_lng(lat, lng)
    cw = DarkSkyService.forecast_query_by_lat_lng(lat, lng)
                          {feels: cw[:apparentTemperature],
                            current_temp: cw[:temperature],
                               visibility: cw[:visibility],
                                  time: Time.at(cw[:time]),
                                    humdity: cw[:humidity],
                                          uv: cw[:uvIndex],
                                           icon: cw[:icon]}
  end


end
