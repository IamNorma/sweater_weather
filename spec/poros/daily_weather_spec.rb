require "rails_helper"

RSpec.describe DailyWeather do
  it "exists" do
    daily_weather_data = {
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

    daily_weather = DailyWeather.new(daily_weather_data)

    expect(daily_weather).to be_a(DailyWeather)
    expect(daily_weather.date).to eq('2020-11-16')
    expect(daily_weather.sunrise).to eq('2020-11-16 04:52:32 -0700')
    expect(daily_weather.sunset).to eq('2020-11-16 14:53:39 -0700')
    expect(daily_weather.max_temp).to eq(67.14)
    expect(daily_weather.min_temp).to eq(56.39)
    expect(daily_weather.conditions).to eq('moderate rain')
    expect(daily_weather.icon).to eq('10d')
  end
end
