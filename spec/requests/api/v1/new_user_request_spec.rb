require 'rails_helper'
describe 'new user' do
  it 'can post a new user' do
    email = "whatever@example.com"
    password = "password"


  post '/api/v1/users', params: {email: email,
                           password: password,
              password_confirmation: password}

  data = JSON.parse(response.body)
  user = User.last
  expect(user.email).to eq(email)
  expect(response.status).to eq(201)
  expect(data.keys).to eq(["api_key"])
  expect(user.api_key).to eq(data["api_key"])
  end

  it 'cannot make a user with bad info' do
  email = ""
  password = "password"


  post '/api/v1/users', params: {email: email,
                           password: password,
              password_confirmation: password}

  data = JSON.parse(response.body)
  expect(response.status).to eq(404)
  expect(data.keys).to eq(["problem"])
  expect(data["problem"]).to eq("you did it not good")
  end
end
