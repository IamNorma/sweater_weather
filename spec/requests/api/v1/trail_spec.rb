require 'rails_helper'

describe "User" do
  it "can retrieve forecast and trail info from location" do

    get '/api/v1/trails?location=denver,co'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data]).to be_a(Hash)

    expect(json[:data][:type]).to eq('trail')
    expect(json[:data]).to have_key(:attributes)

    expect(json[:data][:attributes]).to be_a(Hash)

    expect(json[:data][:attributes]).to have_key(:location)
    expect(json[:data][:attributes]).to have_key(:forecast)
    expect(json[:data][:attributes]).to have_key(:trails)

    expect(json[:data][:attributes][:location]).to be_a(String)

    expect(json[:data][:attributes][:forecast]).to be_a(Hash)
    expect(json[:data][:attributes][:forecast]).to have_key(:summary)
    expect(json[:data][:attributes][:forecast][:summary]).to be_a(String)
    expect(json[:data][:attributes][:forecast]).to have_key(:temperature)
    expect(json[:data][:attributes][:forecast][:temperature]).to be_a(String)

    expect(json[:data][:attributes][:trails]).to be_an(Array)
    expect(json[:data][:attributes][:trails][0]).to be_a(Hash)
    expect(json[:data][:attributes][:trails][0]).to have_key(:name)
    expect(json[:data][:attributes][:trails[0]][:name]).to be_a(String)
    expect(json[:data][:attributes][:trails][0]).to have_key(:summary)
    expect(json[:data][:attributes][:trails[0]][:summary]).to be_a(String)
    expect(json[:data][:attributes][:trails][0]).to have_key(:difficulty)
    expect(json[:data][:attributes][:trails[0]][:difficulty]).to be_a(String)
    expect(json[:data][:attributes][:trails][0]).to have_key(:location)
    expect(json[:data][:attributes][:trails[0]][:location]).to be_a(String)
    expect(json[:data][:attributes][:trails][0]).to have_key(:distance_to_trail)
    expect(json[:data][:attributes][:trails[0]][:distance_to_trail]).to be_a(String)
  end
end
