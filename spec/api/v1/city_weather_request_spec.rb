require 'rails_helper'
describe "sweater weather api" do
  it "can connect" do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
  end
end
