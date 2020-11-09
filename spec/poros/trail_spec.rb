require "rails_helper"

RSpec.describe Trail do
  it "exists" do
    trail_data = {
      "location": 'denver,co',
      "forecast": {
        "summary": 'Cloudy with a chance of meatballs',
        "temperature": "83"
      },
      "trails": [
        {
          "name": "Boulder Skyline Traverse",
          "summary": "The classic long mountain route in Boulder.",
          "difficulty": "black",
          "location": "Superior, Colorado",
          "distance_to_trail": '23.008'
        }
      ]
    }

    trail = Trail.new(trail_data)

    expect(trail).to be_a(Trail)
  end
end
