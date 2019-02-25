require 'rails_helper'
describe "gif request" do
  it "can get images back with summary and time" do
    VCR.use_cassette 'image_request_denver' do

    city_state = "denver,co"
    get "/api/v1/gifs?location=#{city_state}"

    expect(response).to be_successful

    data = JSON.parse(response.body)

    expect(data.keys).to eq(["images", "copywrite"])
    expect(data["copywrite"]).to eq("2019")
    expect(data["images"][0].keys).to eq(["gif_url", "summary", "time"])
    expect(data["images"][0]["time"]).to_not eq(data["images"][1]["time"])
    # The time should also be different
    expect(data["images"][0]["gif_url"]).to_not eq(data["images"][2]["gif_url"])
    # Each <GIPHY_URL_GOES_HERE>  is a link to a different gif that is dependent on the weather
    end
  end
end
