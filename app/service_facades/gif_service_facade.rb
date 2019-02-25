class GifServiceFacade
  attr_reader :gif_data_aray
  def initialize(location)
       @gif_data_aray = gifs_info(location)
  end


  def forecast_info(location)
    ForecastFacade.new(location).forecast_hash[:daily][:data][0...7].map do |day|
      {time: day[:time], summary: day[:summary]}
    end
  end

  def gifs_info(location)
    forecast_info(location).map do |forecast|
       {gif_url: GiphyService.search_gifs(forecast[:summary])[:data][0][:images][:original][:url],
                                                                   summary: forecast[:summary],
                                                                         time: forecast[:time]}
    end
  end
end
