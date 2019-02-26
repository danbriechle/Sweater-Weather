class Favorite < ApplicationRecord
  validates_presence_of :location
  belongs_to :user

  before_create :lat, :lng

  private

  def lat
    self.lat = GoogleGeocodeService.lat(self.location)
  end

  def lng
    self.lng = GoogleGeocodeService.lng(self.location)
  end
end
