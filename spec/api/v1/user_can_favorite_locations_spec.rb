require "rails_helper"
describe "as a registered user" do
  it "can favorite locations" do
    user = User.create(email: "dave@dave.com", password: "daves_really_good_password")
    location = "denver,co"

    post "/api/v1/favorites", params: { location: location,
                                     api_key: user.api_key}
    fav = Favorite.last
    data = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(data.keys).to eq(["message"])
    expect(data["message"]).to eq("#{location} added to favorites")
    expect(fav.location).to eq(location)
    expect(fav.user_id).to eq(user.id)
  end

  it "cannot favorite a location with the wrong api key" do
  end
end
