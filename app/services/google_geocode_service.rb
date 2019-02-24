class GoogleGeocodeService
  
  def self.lng(city_state)
    address_query(city_state)[:results][0][:geometry][:location][:lng]
  end

  def self.lat(city_state)
    address_query(city_state)[:results][0][:geometry][:location][:lat]
  end

  def self.address_query(city_state)
    get_json("/maps/api/geocode/json?address=#{city_state}")
  end

  private

  def self.get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://maps.googleapis.com') do |faraday|
      faraday.params['key'] = ENV['GOOGLE_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end

end
