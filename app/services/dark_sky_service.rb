class DarkSkyService
  def self.key
    ENV['DARK_SKY_API_KEY']
  end

  def self.forecast_query(city_state)
    lat = LocationFacade.new(city_state).lat
    lng = LocationFacade.new(city_state).lng
    get_json("/forecast/#{key}/#{lat},#{lng}")
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
