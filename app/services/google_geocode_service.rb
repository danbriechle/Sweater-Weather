class GoogleGeocodeService
  def initialize(city_state)
    @city_state = city_state
  end

  private
  
  def conn
    Faraday.new(url: 'https://maps.googleapis.com') do |faraday|
      faraday.params['key'] = ENV['GOOGLE_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end
end
