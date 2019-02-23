class Forecast
  def initialize(location)
    @location = location
    @call = DarkSkyService.forecast_query(@location)
    @current = self.current
    @hourly = self.hourly
    @daily = self.daily
  end

  def current
    cw = @call[:currently]
    {feels: cw[:apparentTemperature],
      current_temp: cw[:temperature],
         visibility: cw[:visibility],
            time: Time.at(cw[:time]),
              humdity: cw[:humidity],
                    uv: cw[:uvIndex],
                     icon: cw[:icon]}
  end

  def hourly
    hours = @call[:hourly][:data][0..7]
    hours.map do |hour|
      { time: Time.at(hour[:time]),
         temp: hour[:temperature]}
    end
  end

  def daily
    days = @call[:daily][:data][0..4]
    days.map do |day|
     {chance: day[:precipProbability],
            hi: day[:temperatureHigh],
            low: day[:temperatureLow],
               summary: day[:summary],
                     icon: day[:icon]}
    end
  end

end
