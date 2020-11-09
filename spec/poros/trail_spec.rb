require "rails_helper"

RSpec.describe Trail do
  it "exists" do
    location = "denver,co"
    forecast = {
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
    trail_data = [
        {
            "id": 7006663,
            "name": "Monarch Lake to Crater Lake",
            "type": "Recommended Route",
            "summary": "Gorgeous scenery with waterfalls and wildflowers ending at a breathtaking cirque and glacier lake.",
            "difficulty": "blueBlack",
            "stars": 4.9,
            "starVotes": 85,
            "location": "Granby, Colorado",
            "url": "https://www.hikingproject.com/trail/7006663/monarch-lake-to-crater-lake",
            "imgSqSmall": "https://cdn2.apstatic.com/photos/hike/7002724_sqsmall_1554227142.jpg",
            "imgSmall": "https://cdn2.apstatic.com/photos/hike/7002724_small_1554227142.jpg",
            "imgSmallMed": "https://cdn2.apstatic.com/photos/hike/7002724_smallMed_1554227142.jpg",
            "imgMedium": "https://cdn2.apstatic.com/photos/hike/7002724_medium_1554227142.jpg",
            "length": 14.9,
            "ascent": 2017,
            "descent": -2017,
            "high": 10343,
            "low": 8350,
            "longitude": -105.7463,
            "latitude": 40.1108,
            "conditionStatus": "All Clear",
            "conditionDetails": "Dry, Fallen Trees",
            "conditionDate": "2020-10-10 21:37:09"
        }
      ]
      
  end
end
