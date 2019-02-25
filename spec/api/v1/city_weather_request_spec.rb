require 'rails_helper'
describe "weather request" do
  it "can connect" do
    VCR.use_cassette 'initial_weather_request_denver' do
    city_state = "denver,co"
    get "/api/v1/forecast?location=#{city_state}"

    expect(response).to be_successful
    data = JSON.parse(response.body)
   end
  end

  it "can connect to a different location" do
    VCR.use_cassette 'initial_weather_request_taos' do
    city_state = "taos,nm"
    get "/api/v1/forecast?location=#{city_state}"

    expect(response).to be_successful
    data = JSON.parse(response.body)
   end
  end

  it "can get current weather data" do
    VCR.use_cassette 'current_weather_request_denver' do
    city_state = "denver,co"
    get "/api/v1/forecast?location=#{city_state}"

    data = JSON.parse(response.body)

    expect(data.keys).to eq(["location", "current", "hourly", "daily"])
    expect(data["current"].keys).to eq(["feels", "current_temp", "visibility", "time", "humdity", "uv", "icon"])
    expect(data["hourly"].count).to eq(8)
    expect(data["hourly"].first.keys).to eq(["time", "temp"])
    expect(data["daily"].count).to eq(5)
    expect(data["daily"].first.keys).to eq(["chance", "hi", "low", "summary", "icon"])
    end
  end
end
