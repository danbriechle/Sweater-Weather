class FavoritesPresenter
  attr_reader :favorites
  def initialize(user_id)
    @favorites = favoritesfactory(user_id)
  end

  def favoritesfactory(user_id)
    Favorite.where(user_id: user_id).map do |favorite|
     { location: favorite.location, current_weather: Forecast.new(favorite.location)}
     end
  end

  def deleted_favorites_factory(location)
    { location: location, current_weather: Forecast.new(location)}
  end
end
