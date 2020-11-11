require 'rails_helper'

RSpec.describe 'Road Trip Facade' do
  it 'returns roadtrip data' do
    origin = 'denver,co'
    destination = 'pueblo,co'

    roadtrip = RoadTripFacade.fetch_roadtrip_info(origin, destination)

    expect(roadtrip).to be_a(RoadTrip)

    expect(roadtrip.start_city).to be_a(String)
    expect(roadtrip.end_city).to be_an(String)
    expect(roadtrip.travel_time).to be_an(String)
    expect(roadtrip.temperature).to be_a(Numeric).or(eq(nil))
    expect(roadtrip.conditions).to be_a(String).or(eq(nil))
  end
end
