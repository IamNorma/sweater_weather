require 'rails_helper'

describe "User" do
  it "can retrieve weather for a city" do

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast[:data]).to be_a(Hash)

    expect(forecast[:data][:type]).to eq('forecast')
    expect(forecast[:data]).to have_key(:attributes)

    expect(forecast[:data][:attributes]).to be_a(Hash)

    expect(forecast[:data][:attributes]).to have_key(:current_weather)
    expect(forecast[:data][:attributes][:current_weather]).to be_a(Hash)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:datetime)
    expect(forecast[:data][:attributes][:current_weather][:datetime]).to be_a(String)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:sunrise)
    expect(forecast[:data][:attributes][:current_weather][:sunrise]).to be_a(String)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:sunset)
    expect(forecast[:data][:attributes][:current_weather][:sunset]).to be_a(String)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:temperature)
    expect(forecast[:data][:attributes][:current_weather][:temperature]).to be_a(Float)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:feels_like)
    expect(forecast[:data][:attributes][:current_weather][:feels_like]).to be_a(Float)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:humidity)
    expect(forecast[:data][:attributes][:current_weather][:humidity]).to be_a(Numeric)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:uvi)
    expect(forecast[:data][:attributes][:current_weather][:uvi]).to be_a(Numeric)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:visibility)
    expect(forecast[:data][:attributes][:current_weather][:visibility]).to be_a(Numeric)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:conditions)
    expect(forecast[:data][:attributes][:current_weather][:conditions]).to be_a(String)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:icon)
    expect(forecast[:data][:attributes][:current_weather][:icon]).to be_a(String)

    expect(forecast[:data][:attributes]).to have_key(:daily_weather)
    expect(forecast[:data][:attributes][:daily_weather]).to be_an(Array)
    expect(forecast[:data][:attributes][:daily_weather][0]).to be_a(Hash)
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:date)
    expect(forecast[:data][:attributes][:daily_weather][0][:date]).to be_a(String)
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:sunrise)
    expect(forecast[:data][:attributes][:daily_weather][0][:sunrise]).to be_a(String)
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:sunset)
    expect(forecast[:data][:attributes][:daily_weather][0][:sunset]).to be_a(String)
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:max_temp)
    expect(forecast[:data][:attributes][:daily_weather][0][:max_temp]).to be_a(Float)
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:min_temp)
    expect(forecast[:data][:attributes][:daily_weather][0][:min_temp]).to be_a(Float)
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:conditions)
    expect(forecast[:data][:attributes][:daily_weather][0][:conditions]).to be_a(String)
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:icon)
    expect(forecast[:data][:attributes][:daily_weather][0][:icon]).to be_a(String)

    expect(forecast[:data][:attributes]).to have_key(:hourly_weather)
    expect(forecast[:data][:attributes][:hourly_weather]).to be_an(Array)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to be_a(Hash)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to have_key(:time)
    expect(forecast[:data][:attributes][:hourly_weather][0][:time]).to be_a(String)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to have_key(:temperature)
    expect(forecast[:data][:attributes][:hourly_weather][0][:temperature]).to be_a(Float)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to have_key(:wind_speed)
    expect(forecast[:data][:attributes][:hourly_weather][0][:wind_speed]).to be_a(String)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to have_key(:wind_direction)
    expect(forecast[:data][:attributes][:hourly_weather][0][:wind_direction]).to be_a(String)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to have_key(:conditions)
    expect(forecast[:data][:attributes][:hourly_weather][0][:conditions]).to be_a(String)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to have_key(:icon)
    expect(forecast[:data][:attributes][:hourly_weather][0][:icon]).to be_a(String)
  end

  it "can retrieve weather for a city and should not include uneccessary data" do

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast[:data]).to be_a(Hash)

    expect(forecast[:data][:type]).to eq('forecast')
    expect(forecast[:data]).to have_key(:attributes)

    expect(forecast[:data][:attributes]).to be_a(Hash)

    expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:pressure)
    expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:dew_point)
    expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:clouds)
    expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:wind_speed)
    expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:wind_deg)
    expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:weather)
    
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:day)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:night)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:eve)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:morn)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:feels_like)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:pressure)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:humidity)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:dew_point)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:wind_speed)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:wind_deg)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:id)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:main)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:clouds)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:pop)
    expect(forecast[:data][:attributes][:daily_weather][0]).to_not have_key(:uvi)

    expect(forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:pressure)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:dew_point)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:clouds)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:visibility)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:feels_like)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:pop)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:id)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to_not have_key(:main)
  end
end
