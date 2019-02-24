class Forecast
  def initialize(location)
    @location = location
    @current = current(location)
    @hourly = hourly(location)
    @daily = daily(location)
  end

  def current(location)
    cw = ForecastFacade.new(location).forecast_hash[:currently]
    {feels: cw[:apparentTemperature],
      current_temp: cw[:temperature],
         visibility: cw[:visibility],
            time: Time.at(cw[:time]),
              humdity: cw[:humidity],
                    uv: cw[:uvIndex],
                     icon: cw[:icon]}
  end

  def hourly(location)
    hours = ForecastFacade.new(location).forecast_hash[:hourly][:data][0..7]
    hours.map do |hour|
      { time: Time.at(hour[:time]),
         temp: hour[:temperature]}
    end
  end

  def daily(location)
    days = ForecastFacade.new(location).forecast_hash[:daily][:data][0..4]
    days.map do |day|
     {chance: day[:precipProbability],
            hi: day[:temperatureHigh],
            low: day[:temperatureLow],
               summary: day[:summary],
                     icon: day[:icon]}
    end
  end

end
