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
  end
end
