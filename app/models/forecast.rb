class Forecast
attr_reader :current
  def initialize(location)
    @location = location
    @current = current(location)
    @hourly = hourly(location)
    @daily = daily(location)
  end

  def current(location)
    cw = forecast(location)[:currently]
    {feels: cw[:apparentTemperature],
      current_temp: cw[:temperature],
         visibility: cw[:visibility],
            time: Time.at(cw[:time]),
              humdity: cw[:humidity],
                    uv: cw[:uvIndex],
                     icon: cw[:icon]}
  end

  def hourly(location)
    hours = forecast(location)[:hourly][:data][0..7]
    hours.map do |hour|
      { time: Time.at(hour[:time]),
         temp: hour[:temperature]}
    end
  end

  def daily(location)
    days = forecast(location)[:daily][:data][0..4]
    days.map do |day|
     {chance: day[:precipProbability],
            hi: day[:temperatureHigh],
            low: day[:temperatureLow],
               summary: day[:summary],
                     icon: day[:icon]}
    end
  end

  private

  def forecast(location)
    ForecastServiceFacade.new(location).forecast_hash
  end

end
