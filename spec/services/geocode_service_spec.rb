# require "rails_helper"
# describe 'geocode service' do
#   it 'can get relavant address info from city and state' do
#     city_state = 'denver,co'
#     response = GoogleGeocodeService.address_query(city_state)
#     expected_hash = {:lat => 39.7392358, :lng => -104.990251}
#     expect(response[:results][0][:geometry][:location].keys).to eq([:lat, :lng])
#     expect(response[:results][0][:geometry][:location][:lat].class).to eq(Float)
#     expect(response[:results][0][:geometry][:location][:lng].class).to eq(Float)
#     expect(response[:results][0][:geometry][:location][:lat]).to eq(expected_hash[:lat])
#     expect(response[:results][0][:geometry][:location][:lng]).to eq(expected_hash[:lng])
#   end
#
#   it 'can get latitude from city and state' do
#     city_state = 'denver,co'
#     response = GoogleGeocodeService.lat(city_state)
#     expected_hash = {:lat => 39.7392358, :lng => -104.990251}
#     expect(response).to eq(expected_hash[:lat])
#   end
#
#   it 'can get latitude from city and state' do
#     city_state = 'denver,co'
#     response = GoogleGeocodeService.lng(city_state)
#     expected_hash = {:lat => 39.7392358, :lng => -104.990251}
#     expect(response).to eq(expected_hash[:lng])
#   end
# end
