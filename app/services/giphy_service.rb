class GiphyService

  def self.search_gifs(search_term)
    get_json("/v1/gifs/search?q=#{search_term}&api_key=#{ENV['GIPHY_API_KEY']}&rating=g&lang=en&limit=1")
  end
  def self.get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.giphy.com') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

end
