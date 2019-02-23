require 'rails_helper'
describe "sweater weather api" do
  it "can connect" do
    city_state = "denver,co"
    get "/api/v1/forecast?location=#{city_state}"

    expect(response).to be_successful
    data = JSON.parse(response.body)
  end

  it "can get current weather data" do
    city_state = "denver,co"
    get "/api/v1/forecast?location=#{city_state}"

    data = JSON.parse(response.body)

    expect(data.keys).to eq(["location", "current", "hourly", "daily"])
  end
end
