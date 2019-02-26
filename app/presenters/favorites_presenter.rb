class FavoritesPresenter
  def initialize(user_id)
    @favs = favoritesfactory(user_id)
    binding.pry
  end

  def favoritesfactory(user_id)
    Favorite.where(user_id: user_id).map do |favorite|
     { location: favorite.location, weather: Forecast.new(favorite.location) }
     end
  end
end
