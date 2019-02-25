class GifServiceFacade
  attr_reader :images
  def initialize(location)
    @images = gifs_factory(location)
  end


  def forecast_factory(location)
    ForecastFacade.new(location).forecast_hash[:daily][:data][0...7].map do |day|
      {time: day[:time], summary: day[:summary], icon: day[:icon]}
    end
  end

  def gifs_factory(location)
    forecast_factory(location).map do |forecast|
       {gif_url: GiphyService.unique_gifs(forecast[:icon])[:data][:url],
                                            summary: forecast[:summary],
                                                  time: forecast[:time]}
    end
  end
end
