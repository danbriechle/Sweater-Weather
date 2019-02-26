class Favorite < ApplicationRecord
  validates_presence_of :location
  belongs_to :user

  before_create :latitude, :longitude

  private
  
  def latitude
    self.lat = GoogleGeocodeService.lat(self.location)
  end

  def longitude
    self.lng = GoogleGeocodeService.lng(self.location)
  end
end
