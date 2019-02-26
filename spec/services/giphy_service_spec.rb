require "rails_helper"
describe 'giphy service' do
  it 'can get a giff url from the hourly weather summary' do
    VCR.use_cassette 'search_endpoint_image_request_denver_partly_cloudy' do

    summary = "partly cloudy"
    response = GiphyService.search_gifs(summary)

    gif_url = response[:data][0][:images][:original][:url]
    gif_url_hardcoded = "https://media0.giphy.com/media/G1T5M0qT6ZJlu/giphy.gif"
    expect(gif_url.class).to be(String)
    expect(gif_url).to eq(gif_url_hardcoded)
   end
  end

  it "can get a unique gif based on each weather summary" do
    VCR.use_cassette 'random_endpoint_image_request_denver_partly_cloudy' do
    summary = "partly cloudy"
    response_1 = GiphyService.unique_gifs(summary)
    response_2 = GiphyService.unique_gifs(summary)

    gif_url_1 = response_1[:data][:images][:original][:url]
    gif_url_2 = response_2[:data][:images][:original][:url]
    expect(gif_url_1.class).to be(String)
    expect(gif_url_1).to_not eq(gif_url_2)
    end
  end
end
