class AddLatLngToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :lat, :string
    add_column :favorites, :lng, :string
  end
end
