require "rails_helper"

RSpec.describe Trail do
  it "exists" do
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

    trail = Trail.new(trail_data)

    expect(trail).to be_a(Trail)
  end
end
