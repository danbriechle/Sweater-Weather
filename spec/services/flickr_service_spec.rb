require "rails_helper"
describe "flickr service" do
  it "can get get a background image" do
    city_state = 'denver,co'
    response = FlickrService.image_query(city_state)

    expect(response.keys).to eq([:photos, :stat])
  end
end
