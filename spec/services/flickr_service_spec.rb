require "rails_helper"
describe "flickr service" do
  it "can get get a be queried for a variety of back ground images" do
    city_state = 'denver,co'
    response = FlickrService.image_query(city_state)

    expect(response.keys).to eq([:photos, :stat])
  end

  it "can get get a sample photo" do
    city_state = 'denver,co'
    response = FlickrService.sample_photo(city_state)

    expect(response.keys).to eq([:id, :owner, :secret, :server, :farm, :title, :ispublic, :isfriend, :isfamily])
  end
end
