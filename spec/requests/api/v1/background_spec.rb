require 'rails_helper'

describe "Backgrounds" do
  it "can fetch a background image for a city" do

    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data]).to be_a(Hash)

    expect(json[:data][:type]).to eq('background')
    expect(json[:data]).to have_key(:attributes)

    expect(json[:data][:attributes]).to be_a(Hash)

    expect(json[:data][:attributes]).to have_key(:location)
    expect(json[:data][:attributes][:location]).to be_a(String)
    expect(json[:data][:attributes]).to have_key(:width)
    expect(json[:data][:attributes][:width]).to be_an(Integer)
    expect(json[:data][:attributes]).to have_key(:height)
    expect(json[:data][:attributes][:height]).to be_an(Integer)
    expect(json[:data][:attributes]).to have_key(:color)
    expect(json[:data][:attributes][:color]).to be_a(String)
    expect(json[:data][:attributes]).to have_key(:description)
    expect(json[:data][:attributes][:description]).to be_a(String)
    expect(json[:data][:attributes]).to have_key(:author)
    expect(json[:data][:attributes][:author]).to be_a(Hash)
    expect(json[:data][:attributes][:author]).to have_key(:name)
    expect(json[:data][:attributes][:author][:name]).to be_a(String)
    expect(json[:data][:attributes][:author]).to have_key(:splash_profile)
    expect(json[:data][:attributes][:author][:splash_profile]).to be_a(String)
    expect(json[:data][:attributes][:author]).to have_key(:instagram_username)
    expect(json[:data][:attributes][:author][:instagram_username]).to be_a(String)
    expect(json[:data][:attributes][:author]).to have_key(:twitter_username)
    expect(json[:data][:attributes][:author][:twitter_username]).to be_a(String)
    expect(json[:data][:attributes]).to have_key(:urls)
    expect(json[:data][:attributes][:urls]).to be_a(Hash)
    expect(json[:data][:attributes][:urls]).to have_key(:raw)
    expect(json[:data][:attributes][:urls][:raw]).to be_a(String)
    expect(json[:data][:attributes][:urls]).to have_key(:regular)
    expect(json[:data][:attributes][:urls][:regular]).to be_a(String)
  end
end
