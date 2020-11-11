require 'rails_helper'

RSpec.describe 'Road Trip Facade' do
  it 'returns roadtrip data' do
    origin = 'denver,co'
    destination = 'pueblo,co'

    roadtrip = RoadTripFacade.fetch_roadtrip_info(origin, destination)

    expect(roadtrip).to be_a(Roadtrip)

    expect(roadtrip.start_city).to be_a(String)
    expect(roadtrip.end_city).to be_an(Integer)
    expect(roadtrip.travel_time).to be_an(Integer)
    expect(roadtrip.weather_at_eta).to be_a(Hash)
    expect(roadtrip.temperature).to be_a(Numeric)
    expect(roadtrip.conditions).to be_a(String)
    expect(roadtrip.note).to be_a(String).or(eq(nil))
  end
end
