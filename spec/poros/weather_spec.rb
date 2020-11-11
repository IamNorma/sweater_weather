require "rails_helper"

RSpec.describe Weather do
  it "exists" do
    weather_data = {
      "lat": 38.89,
      "lon": -77.02,
      "timezone": "America/New_York",
      "timezone_offset": -18000,
      "current": {
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
      },
      "hourly": [
        {
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
      ],
      "daily": [
        {
          "dt": 1605542400,
          "sunrise": 1605527552,
          "sunset": 1605563619,
          "temp": {
            "day": 62.85,
            "min": 56.39,
            "max": 67.14,
            "night": 56.48,
            "eve": 67.14,
            "morn": 57.34
          },
          "feels_like": {
            "day": 62.8,
            "night": 45.57,
            "eve": 59.86,
            "morn": 55.02
          },
          "pressure": 1011,
          "humidity": 91,
          "dew_point": 60.19,
          "wind_speed": 6.04,
          "wind_deg": 234,
          "weather": [
            {
              "id": 501,
              "main": "Rain",
              "description": "moderate rain",
              "icon": "10d"
            }
          ],
          "clouds": 100,
          "pop": 1,
          "rain": 3.68,
          "uvi": 2.37
        }
      ]
    }

    weather = Weather.new(weather_data)

    expect(weather).to be_a(Weather)

    expect(weather.current_weather).to be_a(CurrentWeather)
    expect(weather.daily_weather[0]).to be_a(DailyWeather)
    expect(weather.hourly_weather[0]).to be_a(HourlyWeather)

    expect(weather.current_weather.datetime).to eq('2020-11-08 23:28:48 -0700')
    expect(weather.current_weather.sunrise).to eq('2020-11-09 04:44:41 -0700')
    expect(weather.current_weather.sunset).to eq('2020-11-09 14:59:19 -0700')
    expect(weather.current_weather.temperature).to eq(57.36)
    expect(weather.current_weather.feels_like).to eq(57.13)
    expect(weather.current_weather.humidity).to eq(93)
    expect(weather.current_weather.uvi).to eq(3.2)
    expect(weather.current_weather.visibility).to eq(10000)
    expect(weather.current_weather.conditions).to eq('scattered clouds')
    expect(weather.current_weather.icon).to eq('03n')

    expect(weather.daily_weather.first.date).to eq('2020-11-16')
    expect(weather.daily_weather.first.sunrise).to eq('2020-11-16 04:52:32 -0700')
    expect(weather.daily_weather.first.sunset).to eq('2020-11-16 14:53:39 -0700')
    expect(weather.daily_weather.first.max_temp).to eq(67.14)
    expect(weather.daily_weather.first.min_temp).to eq(56.39)
    expect(weather.daily_weather.first.conditions).to eq('moderate rain')
    expect(weather.daily_weather.first.icon).to eq('10d')

    expect(weather.hourly_weather.first.time).to eq('22:00:00')
    expect(weather.hourly_weather.first.temperature).to eq(65.23)
    expect(weather.hourly_weather.first.wind_speed).to eq('8.68 mph')
    expect(weather.hourly_weather.first.wind_direction).to eq('S')
    expect(weather.hourly_weather.first.conditions).to eq('clear sky')
    expect(weather.hourly_weather.first.icon).to eq('01n')
  end
end
