require "rails_helper"
describe "as a registered user" do
  it "can favorite locations" do
    VCR.use_cassette 'favorite_locations' do
    location_1 = "denver,co"
    location_2 = "taos,nm"
    location_3 = "austin, tx"
    user_1 = User.create(email: "dave@dave.com", password: "daves_really_good_password")
    user_2 = User.create(email: "donna@dave.com", password: "donnas_really_good_password")
    fav_1 = user_1.favorites.create(location: location_1)
    fav_2 = user_1.favorites.create(location: location_2)
    fav_3 = user_2.favorites.create(location: location_3)

    get "/api/v1/favorites", params: {api_key: user_1.api_key}

    data = JSON.parse(response.body)


    expect(response.status).to eq(200)
    expect(data.count).to eq(2)
    expect(data[0]["location"]).to eq(location_1)
    expect(data[1]["location"]).to eq(location_2)
    expect(data[0]["current_weather"].keys).to eq(["location", "current", "hourly", "daily"])
    end
  end

  it "cannot see favorites with bad info" do
    location_1 = "denver,co"
    location_2 = "taos,nm"
    location_3 = "austin, tx"
    user_1 = User.create(email: "dave@dave.com", password: "daves_really_good_password")
    user_2 = User.create(email: "donna@dave.com", password: "donnas_really_good_password")
    fav_1 = user_1.favorites.create(location: location_1)
    fav_2 = user_1.favorites.create(location: location_2)
    fav_3 = user_2.favorites.create(location: location_3)

    get "/api/v1/favorites", params: {api_key: "poop_emoji"}

    data = JSON.parse(response.body)

    expect(response.status).to eq(401)
    expect(data.keys).to eq(["problem"])
    expect(data["problem"]).to eq("you did it not good")
  end
end
