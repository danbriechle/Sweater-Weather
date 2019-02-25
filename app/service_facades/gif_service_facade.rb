class GifServiceFacade

  def initialize(location)
       @forecast_info_array = forecast_info(location)
       binding.pry
  end


  def forecast_info(location)
    DarkSkyService.forecast_query(location)[:daily][:data][0...7].map do |day|
      {time: day[:time], summary: day[:summary], icon: day[:icon]}
    end
  end
end
