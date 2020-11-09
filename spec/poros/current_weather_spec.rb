require "rails_helper"

RSpec.describe CurrentWeather do
  it "exists" do
    current_weather_data = {
      "dt": 1604903328,
      "sunrise": 1604922281,
      "sunset": 1604959159,
      "temp": 57.36,
      "feels_like": 57.13,
      "pressure": 1028,
      "humidity": 93,
      "dew_point": 55.36,
      "uvi": 3.2,
      "clouds": 40,
      "visibility": 10000,
      "wind_speed": 3.36,
      "wind_deg": 210,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03n"
        }
      ]
    }

    current_weather = CurrentWeather.new(current_weather_data)

    expect(current_weather).to be_a(CurrentWeather)
    expect(current_weather.datetime).to eq('2020-11-08 23:28:48 -0700')
    expect(current_weather.sunrise).to eq('2020-11-09 04:44:41 -0700')
    expect(current_weather.sunset).to eq('2020-11-09 14:59:19 -0700')
    expect(current_weather.temperature).to eq(57.36)
    expect(current_weather.feels_like).to eq(57.13)
    expect(current_weather.humidity).to eq(93)
    expect(current_weather.uvi).to eq(3.2)
    expect(current_weather.visibility).to eq(10000)
    expect(current_weather.conditions).to eq('scattered clouds')
    expect(current_weather.icon).to eq('03n')
  end
end
