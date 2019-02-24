require "rails_helper"
describe "background image request" do
  it "can connect" do
    city_state = "denver,co"

    get "/api/v1/backgrounds?location=#{city_state}"

    data = JSON.parse(response.body)

    expect(response).to be_successful
    expect(data.keys).to eq(["location", "image"])
    expect(data["location"]).to eq(city_state)
  end
end
