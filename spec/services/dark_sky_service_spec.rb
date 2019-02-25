require "rails_helper"
describe "dark sky service" do
  it "can get current weather information" do
    VCR.use_cassette 'current_weather_darksky_request_denver' do
    city_state = 'denver,co'
    response = DarkSkyService.forecast_query(city_state)

    expect(response.keys).to eq([:latitude, :longitude, :timezone, :currently, :minutely, :hourly, :daily, :flags, :offset])
    end
  end
end
