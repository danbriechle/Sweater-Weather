require "rails_helper"
describe 'giphy service' do
  it 'can get a giff url from the hourly weather summary' do
    summary = "partly cloudy"
    response = GiphyService.search_gifs(summary)

    gif_url = response[:data][0][:images][:original][:url]
    gif_url_hardcoded = "https://media2.giphy.com/media/12AwtlTuPlF29y/giphy.gif"
    expect(gif_url.class).to be(String)
    expect(gif_url).to eq(gif_url_hardcoded)
  end
end
