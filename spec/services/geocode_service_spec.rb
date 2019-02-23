describe 'geocode service' do
  it 'can get lat and long from city and state' do
    city_state = 'denver,co'
    response = GoogleGeocodeService.new(city_state)
  end
end
