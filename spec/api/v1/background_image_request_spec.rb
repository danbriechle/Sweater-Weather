require "rails_helper"
describe "background image request" do
  it "can connect" do
    city_state = "denver,co"

    get "/api/v1/backgrounds?location=#{city_state}"

    expect(response).to be_successful
  end
end
