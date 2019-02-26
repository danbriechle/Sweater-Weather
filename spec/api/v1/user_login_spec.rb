require 'rails_helper'
describe 'registered user' do
  it 'can login' do
    email =  "dave@dave.com"
    password = "best_password"
    user = User.create(password: password, email: email)

    post "/api/v1/sessions", params: {email: email,
                                password: password,
                   password_confirmation: password}

    data = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(data.keys).to eq(["api_key"])
    expect(data["api_key"]).to eq(user.api_key)
  end

end
