class Forecast
  def initialize(location)
    @location = location
    @current = {}
    @hourly = {}
    @daily = {}
  end
end
