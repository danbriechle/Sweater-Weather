require "rails_helper"
describe "flickr service" do
  it "can get get a background image" do
    city_state = 'denver,co'
    response = FlickrService.new(city_state)

    expect(response.keys).to eq([:latitude, :longitude, :timezone, :currently, :minutely, :hourly, :daily, :flags, :offset])
  end
end
