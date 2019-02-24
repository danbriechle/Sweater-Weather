class FlickrService

  def self.photo_url(city_state)
    sample = sample_photo(city_state)
    photo_info = {
      server: sample[:server],
      secret: sample[:secret],
      farm: sample[:farm],
      id: sample[:id]}

    "https://farm#{photo_info[:farm]}.staticflickr.com/#{photo_info[:server]}/#{photo_info[:id]}_#{photo_info[:secret]}.jpg"
  end

  def self.sample_photo(city_state)
    image_query(city_state)[:photos][:photo].sample
  end

  def self.image_query(city_state)
    lat = GoogleGeocodeService.lat(city_state)
    lng = GoogleGeocodeService.lng(city_state)
    get_json("/services/rest?method=flickr.photos.search&api_key=#{ENV['FLICKR_API_KEY']}&lat=#{lat}lon=#{lng}&geo_context=2&radius=20&format=json&sort=relevance")
  end

  def self.get_json(url)
    response = conn.get(url)
    JSON.parse(response.body.gsub("jsonFlickrApi(", "").chop, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.flickr.com') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end


end
