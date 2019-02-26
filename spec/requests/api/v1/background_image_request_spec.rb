require "rails_helper"
describe "background image request" do
  it "can connect" do
    VCR.use_cassette 'background_image_request' do
    city_state = "denver,co"

    get "/api/v1/backgrounds?location=#{city_state}"

    data = JSON.parse(response.body)

    expect(response).to be_successful
    expect(data.keys).to eq(["image"])
    end
  end
end
