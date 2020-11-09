require "rails_helper"

RSpec.describe HourlyWeather do
  it "exists" do
    hourly_weather_data = {
      "dt": 1605070800,
      "temp": 65.23,
      "feels_like": 63.97,
      "pressure": 1019,
      "humidity": 86,
      "dew_point": 61.21,
      "clouds": 3,
      "visibility": 10000,
      "wind_speed": 8.68,
      "wind_deg": 178,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "pop": 0
    }

    hourly_weather = HourlyWeather.new(hourly_weather_data)

    expect(hourly_weather).to be_a(HourlyWeather)
    expect(hourly_weather.time).to eq('22:00:00')
    expect(hourly_weather.temperature).to eq(65.23)
    expect(hourly_weather.wind_speed).to eq('8.68 mph')
    expect(hourly_weather.wind_direction).to eq('NE')
    expect(hourly_weather.conditions).to eq('clear sky')
    expect(hourly_weather.icon).to eq('01n')
  end
end
