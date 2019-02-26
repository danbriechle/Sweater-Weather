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
    expect(response.status).to eq(200)
    expect(data[0]["location"]).to eq("Denver,CO")
    expect(data[0]["location"]).to eq("Auston,TX")
    end
  end
end
