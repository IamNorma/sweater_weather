require 'rails_helper'

RSpec.describe WeatherService do
  it 'fetch weather and forecast from latitude and longitude' do
    latitude = 38.892062
    longitude = -77.019912

    json = WeatherService.weather_forecast(latitude, longitude)

    expect(json).to be_a(Hash)
    expect(json).to have_key(:current)
    expect(json).to have_key(:hourly)
    expect(json).to have_key(:daily)

    expect(json[:current]).to be_a(Hash)
    expect(json[:hourly]).to be_a(Hash)
    expect(json[:daily]).to be_a(Hash)

    expect(json[:current]).to have_key(:dt)
    expect(json[:current]).to have_key(:sunrise)
    expect(json[:current]).to have_key(:sunset)
    expect(json[:current]).to have_key(:temp)
    expect(json[:current]).to have_key(:feels_like)
    expect(json[:current]).to have_key(:pressure)
    expect(json[:current]).to have_key(:humidity)
    expect(json[:current]).to have_key(:dew_point)
    expect(json[:current]).to have_key(:uvi)
    expect(json[:current]).to have_key(:clouds)
    expect(json[:current]).to have_key(:visibility)
    expect(json[:current]).to have_key(:wind_speed)
    expect(json[:current]).to have_key(:wind_deg)
    expect(json[:current]).to have_key(:weather)
    expect(json[:current][:weather]).to be_an(Array)
    expect(json[:current][:weather][0]).to have_key(:description)
    expect(json[:current][:weather][0]).to have_key(:icon)

    expect(json[:hourly]).to have_key(:dt)
    expect(json[:hourly]).to have_key(:temp)
    expect(json[:hourly]).to have_key(:feels_like)
    expect(json[:hourly]).to have_key(:pressure)
    expect(json[:hourly]).to have_key(:humidity)
    expect(json[:hourly]).to have_key(:dew_point)
    expect(json[:hourly]).to have_key(:clouds)
    expect(json[:hourly]).to have_key(:visibility)
    expect(json[:hourly]).to have_key(:wind_speed)
    expect(json[:hourly]).to have_key(:wind_deg)
    expect(json[:hourly]).to have_key(:weather)
    expect(json[:hourly][:weather]).to be_an(Array)
    expect(json[:hourly][:weather][0]).to have_key(:description)
    expect(json[:hourly][:weather][0]).to have_key(:icon)

    expect(json[:daily]).to have_key(:dt)
    expect(json[:daily]).to have_key(:sunrise)
    expect(json[:daily]).to have_key(:sunset)
    expect(json[:daily]).to have_key(:temp)
    expect(json[:daily][:temp]).to be_a(Hash)
    expect(json[:daily]).to have_key(:feels_like)
    expect(json[:daily][:feels_like]).to be_a(Hash)
    expect(json[:daily]).to have_key(:pressure)
    expect(json[:daily]).to have_key(:humidity)
    expect(json[:daily]).to have_key(:dew_point)
    expect(json[:daily]).to have_key(:wind_speed)
    expect(json[:daily]).to have_key(:wind_deg)
    expect(json[:daily]).to have_key(:weather)
    expect(json[:daily][:weather]).to be_an(Array)
    expect(json[:daily][:weather][0]).to have_key(:description)
    expect(json[:daily][:weather][0]).to have_key(:icon)
    expect(json[:daily]).to have_key(:clouds)
    expect(json[:daily]).to have_key(:pop)
    expect(json[:daily]).to have_key(:rain)
    expect(json[:daily]).to have_key(:uvi)
  end
end
