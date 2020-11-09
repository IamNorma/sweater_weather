require 'rails_helper'

RSpec.describe 'Weather Facade' do
  it 'returns weather based on location' do
    location = 'denver,co'

    trail = TrailFacade.fetch_trail_info(location)

    expect(trail).to be_a(Trail)

    expect(trail.location).to be_a(String)

    expect(trail.forecast).to be_a(Hash)
    expect(trail.forecast.summary).to be_a(String)
    expect(trail.forecast.temperature).to be_a(String)

    expect(trail.trails.first.name).to be_a(String)
    expect(trail.trails.first.summary).to be_a(String)
    expect(trail.trails.first.difficulty).to be_a(String)
    expect(trail.trails.first.location).to be_a(String)
    expect(trail.trails.first.distance_to_trail).to be_a(String)
  end
end
