require "rails_helper"

describe "as a registered user " do
  it "can remove a favorite location " do
    VCR.use_cassette 'fav_no_mo' do
    user = User.create(email: "dave@dave.com", password: "daves_super_secret_password")
    fav_1 = user.favorites.create(location: "Austin,TX")
    fav_2 = user.favorites.create(location: "Denver,CO")

    delete "/api/v1/favorites", params: { "location": "Denver,CO",
                                         "api_key": user.api_key }
    data = JSON.parse(response.body)
    favs = Favorite.all
    expect(response.status).to eq(200)
    expect(data["deleted_location"]).to eq("Denver,CO")
    expect(data.keys).to eq(["deleted_location", "current_weather"])
    expect(favs.count).to eq(1)
    expect(favs[0].location).to eq("Austin,TX")
    end
  end

  it "cannot remove a favorite location with out proper info" do
    user = User.create(email: "dave@dave.com", password: "daves_super_secret_password")
    fav_1 = user.favorites.create(location: "Austin,TX")
    fav_2 = user.favorites.create(location: "Denver,CO")

    delete "/api/v1/favorites", params: { "location": "Denver,CO",
                                         "api_key": "poop_emoji" }
    data = JSON.parse(response.body)
    expect(response.status).to eq(401)
    expect(data["problem"]).to eq("you did it not good")
  end
end
