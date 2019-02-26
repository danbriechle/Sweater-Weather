class DarkSkyService

  def self.forecast_query(city_state)
    lat = LocationServiceFacade.new(city_state).lat
    lng = LocationServiceFacade.new(city_state).lng
    get_json("/forecast/#{ENV['DARK_SKY_API_KEY']}/#{lat},#{lng}")
  end

  def self.forecast_query_by_lat_lng(lat, lng)
    get_json("/forecast/#{ENV['DARK_SKY_API_KEY']}/#{lat},#{lng}")
  end

  def self.get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.darksky.net") do |f|
      f.adapter Faraday.default_adapter
    end
  end

 end
