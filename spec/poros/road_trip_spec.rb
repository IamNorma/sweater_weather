require "rails_helper"

RSpec.describe RoadTrip do
  it "exists" do
    origin = 'denver,co'
    destination = 'pueblo,co'
    roadtrip_data = {
      "route": {
        "distance": 111.38,
        "realTime": 6323,
        "locations": [
          {
            "dragPoint": false,
            "displayLatLng": {
              "lng": -104.984856,
              "lat": 39.738453
            },
            "adminArea4": "Denver County",
            "adminArea5": "Denver",
            "postalCode": "",
            "adminArea1": "US",
            "adminArea3": "CO",
            "type": "s",
            "sideOfStreet": "N",
            "geocodeQualityCode": "A5XAX",
            "adminArea4Type": "County",
            "linkId": 35589410,
            "street": "",
            "adminArea5Type": "City",
            "geocodeQuality": "CITY",
            "adminArea1Type": "Country",
            "adminArea3Type": "State",
            "latLng": {
              "lng": -104.984853,
              "lat": 39.738453
            }
          },
          {
            "dragPoint": false,
            "displayLatLng": {
              "lng": -104.610413,
              "lat": 38.265427
            },
            "adminArea4": "Pueblo County",
            "adminArea5": "Pueblo",
            "postalCode": "",
            "adminArea1": "US",
            "adminArea3": "CO",
            "type": "s",
            "sideOfStreet": "N",
            "geocodeQualityCode": "A5XAX",
            "adminArea4Type": "County",
            "linkId": 48374268,
            "street": "",
            "adminArea5Type": "City",
            "geocodeQuality": "CITY",
            "adminArea1Type": "Country",
            "adminArea3Type": "State",
            "latLng": {
              "lng": -104.610415,
              "lat": 38.265425
            }
          }
        ]
      }
    }
    forecast = {
      "current": {
        "dt": 1605075344
      },
      "hourly": [
        {
          "dt": 1605074400,
          "temp": 36.01,
          "feels_like": 23.99,
          "pressure": 1013,
          "humidity": 40,
          "dew_point": 16.03,
          "clouds": 1,
          "visibility": 10000,
          "wind_speed": 11.59,
          "wind_deg": 300,
          "weather": [
            {
              "id": 800,
              "main": "Clear",
              "description": "clear sky",
              "icon": "01n"
            }
          ],
          "pop": 0
        },
        {
          "dt": 1605078000,
          "temp": 36.21,
          "feels_like": 25.34,
          "pressure": 1015,
          "humidity": 53,
          "dew_point": 22.01,
          "clouds": 1,
          "visibility": 10000,
          "wind_speed": 10.56,
          "wind_deg": 296,
          "weather": [
            {
              "id": 800,
              "main": "Clear",
              "description": "clear sky",
              "icon": "01n"
            }
          ],
          "pop": 0
        },
        {
          "dt": 1605081600,
          "temp": 35.31,
          "feels_like": 25.52,
          "pressure": 1017,
          "humidity": 62,
          "dew_point": 24.57,
          "clouds": 0,
          "visibility": 10000,
          "wind_speed": 9.15,
          "wind_deg": 295,
          "weather": [
            {
              "id": 800,
              "main": "Clear",
              "description": "clear sky",
              "icon": "01n"
            }
          ],
          "pop": 0
        },
        {
          "dt": 1605085200,
          "temp": 36.52,
          "feels_like": 23.99,
          "pressure": 1013,
          "humidity": 40,
          "dew_point": 16.03,
          "clouds": 1,
          "visibility": 10000,
          "wind_speed": 11.59,
          "wind_deg": 300,
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
      ]
    }

    roadtrip = RoadTrip.new(roadtrip_data, forecast, origin, destination)

    expect(roadtrip).to be_a(RoadTrip)
    expect(roadtrip.start_city).to eq('denver,co')
    expect(roadtrip.end_city).to eq('pueblo,co')
    expect(roadtrip.travel_time).to eq('1h45m')
    expect(roadtrip.temperature).to eq(35.31)
    expect(roadtrip.conditions).to eq('clear sky')
  end
end
