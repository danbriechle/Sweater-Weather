class FlickrService

  def self.image_query(city_state)
    lat = GoogleGeocodeService.lat(city_state)
    lng = GoogleGeocodeService.lng(city_state)
    get_json("/services/rest?method=flickr.photos.search&api_key=bf684048408505f47affbf4338bc2f7c&lat=#{lat}lon=#{lng}&geo_context=2&radius=20&format=json")
  end

  private

  def self.get_json(url)
    response = conn.get(url)
    JSON.parse(response.body.gsub("jsonFlickrApi(", "").chop, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.flickr.com') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def self.sample_photo(city_state)
    image_query(city_state)[:photos][:photo].sample
  end

end
