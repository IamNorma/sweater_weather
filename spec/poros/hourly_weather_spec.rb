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
    expect(hourly_weather.wind_direction).to eq('S')
    expect(hourly_weather.conditions).to eq('clear sky')
    expect(hourly_weather.icon).to eq('01n')
  end

  it ".format_wind_direction" do
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

    hourly_weather_data[:wind_deg] = 10
    hourly_weather = HourlyWeather.new(hourly_weather_data)
    expect(hourly_weather.wind_direction).to eq('N')

    hourly_weather_data[:wind_deg] = 12
    hourly_weather = HourlyWeather.new(hourly_weather_data)
    expect(hourly_weather.wind_direction).to eq('NNE')

    hourly_weather_data[:wind_deg] = 35
    hourly_weather = HourlyWeather.new(hourly_weather_data)
    expect(hourly_weather.wind_direction).to eq('NE')

    hourly_weather_data[:wind_deg] = 60
    hourly_weather = HourlyWeather.new(hourly_weather_data)
    expect(hourly_weather.wind_direction).to eq('ENE')

    hourly_weather_data[:wind_deg] = 90
    hourly_weather = HourlyWeather.new(hourly_weather_data)
    expect(hourly_weather.wind_direction).to eq('E')

    hourly_weather_data[:wind_deg] = 120
    hourly_weather = HourlyWeather.new(hourly_weather_data)
    expect(hourly_weather.wind_direction).to eq('ESE')

    hourly_weather_data[:wind_deg] = 140
    hourly_weather = HourlyWeather.new(hourly_weather_data)
    expect(hourly_weather.wind_direction).to eq('SE')

    hourly_weather_data[:wind_deg] = 150
    hourly_weather = HourlyWeather.new(hourly_weather_data)
    expect(hourly_weather.wind_direction).to eq('SSE')

    hourly_weather_data[:wind_deg] = 180
    hourly_weather = HourlyWeather.new(hourly_weather_data)
    expect(hourly_weather.wind_direction).to eq('S')

    hourly_weather_data[:wind_deg] = 200
    hourly_weather = HourlyWeather.new(hourly_weather_data)
    expect(hourly_weather.wind_direction).to eq('SSW')

    hourly_weather_data[:wind_deg] = 230
    hourly_weather = HourlyWeather.new(hourly_weather_data)
    expect(hourly_weather.wind_direction).to eq('SW')

    hourly_weather_data[:wind_deg] = 240
    hourly_weather = HourlyWeather.new(hourly_weather_data)
    expect(hourly_weather.wind_direction).to eq('WSW')

    hourly_weather_data[:wind_deg] = 260
    hourly_weather = HourlyWeather.new(hourly_weather_data)
    expect(hourly_weather.wind_direction).to eq('W')

    hourly_weather_data[:wind_deg] = 300
    hourly_weather = HourlyWeather.new(hourly_weather_data)
    expect(hourly_weather.wind_direction).to eq('WNW')

    hourly_weather_data[:wind_deg] = 315
    hourly_weather = HourlyWeather.new(hourly_weather_data)
    expect(hourly_weather.wind_direction).to eq('NW')

    hourly_weather_data[:wind_deg] = 330
    hourly_weather = HourlyWeather.new(hourly_weather_data)
    expect(hourly_weather.wind_direction).to eq('NNW')
  end
end
