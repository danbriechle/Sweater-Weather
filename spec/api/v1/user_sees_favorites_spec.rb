require "rails_helper"
describe "as a registered user" do
  it "can favorite locations" do
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
    binding.pry
    expect(data[0]["weather"].keys).to eq()
  end
end
