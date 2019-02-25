require "rails_helper"
describe "flickr service" do
  it "can get get a be queried for a variety of back ground images" do
    VCR.use_cassette 'current_weather_image_request_denver' do
    city_state = 'denver,co'
    response = FlickrService.image_query(city_state)

    expect(response.keys).to eq([:photos, :stat])
    end
  end

  it "can get get a sample photo" do
    VCR.use_cassette 'current_weather_image_request_denver_and_taos' do
    city_state_1 = 'denver,co'
    city_state_2 = 'taos,nm'
    response_1 = FlickrService.sample_photo(city_state_1)
    response_2 = FlickrService.sample_photo(city_state_2)

    expect(response_1.keys).to eq([:id, :owner, :secret, :server, :farm, :title, :ispublic, :isfriend, :isfamily])
    expect(response_2.keys).to eq([:id, :owner, :secret, :server, :farm, :title, :ispublic, :isfriend, :isfamily])
    expect(response_1).to_not eq(response_2)
    end
  end

  it "can get a photo url" do
    VCR.use_cassette 'current_weather_image_request_denver_to_url' do
    city_state = 'taos,nm'
    response = FlickrService.photo_url(city_state)

    expect(response.class).to be(String)
   end
  end
end
