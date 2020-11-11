require 'rails_helper'

describe "Road Trip API" do
  before(:each) do
    @user = User.create!(email: 'whatever@example.com', password: 'password', password_confirmation: 'password')
    @headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
  end

  it "returns road trip info " do
    params = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": @user.api_key
    }

    post '/api/v1/road_trip', headers: @headers, params: JSON.generate(params)

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data]).to be_a(Hash)

    expect(json[:data][:id]).to eq(nil)
    expect(json[:data][:type]).to eq('roadtrip')
    expect(json[:data]).to have_key(:attributes)

    expect(json[:data][:attributes]).to be_a(Hash)

    expect(json[:data][:attributes]).to have_key(:start_city)
    expect(json[:data][:attributes][:start_city]).to be_a(String)
    expect(json[:data][:attributes]).to have_key(:end_city)
    expect(json[:data][:attributes][:end_city]).to be_a(String)
    expect(json[:data][:attributes]).to have_key(:travel_time)
    expect(json[:data][:attributes][:travel_time]).to be_an(String)
    expect(json[:data][:attributes]).to have_key(:weather_at_eta)
    expect(json[:data][:attributes][:weather_at_eta]).to be_a(Hash)

    expect(json[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(json[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
    expect(json[:data][:attributes][:weather_at_eta]).to have_key(:note)

    expect(json[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Numeric)
    expect(json[:data][:attributes][:weather_at_eta][:temperature]).to be_a(String)
    expect(json[:data][:attributes][:weather_at_eta][:temperature]).to be_a(String).or(eq(nil))
  end
end