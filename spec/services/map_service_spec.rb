require 'rails_helper'

RSpec.describe MapService do
  it 'fetch geocode from address' do
    location = 'denver,co'
    json = MapService.geocode(location)

    expect(json).to be_a(Hash)
    expect(json).to have_key(:results)
    expect(json[:results]).to be_an(Array)

    expect(json[:results][0]).to have_key(:locations)
    expect(json[:results][0][:locations][0]).to be_a(Hash)
    expect(json[:results][0][:locations][0]).to have_key(:latLng)

    lat_lng = json[:results][0][:locations][0][:latLng]

    expect(lat_lng).to be_a(Hash)
    expect(lat_lng).to have_key(:lat)
    expect(lat_lng).to have_key(:lng)

    expect(lat_lng[:lat]).to be_a(Float)
    expect(lat_lng[:lng]).to be_a(Float)
  end

  it 'fetch route for two places' do
    origin = 'denver,co'
    destination = 'pueblo,co'
    json = MapService.route(origin, destination)

    expect(json).to be_a(Hash)
    expect(json).to have_key(:route)
    expect(json[:route]).to be_a(Hash)

    expect(json[:route]).to have_key(:realTime)
    expect(json[:route]).to have_key(:distance)
    expect(json[:route]).to have_key(:time)
    expect(json[:route]).to have_key(:locations)

    expect(json[:route][:realTime]).to be_an(Integer)
    expect(json[:route][:distance]).to be_a(Numeric)
    expect(json[:route][:time]).to be_an(Integer)
    expect(json[:route][:locations]).to be_an(Array)

    expect(json[:route][:locations][1]).to have_key(:latLng)
    expect(json[:route][:locations][1]).to be_a(Hash)
    expect(json[:route][:locations][1][:latLng]).to have_key(:lng)
    expect(json[:route][:locations][1][:latLng]).to have_key(:lat)

    expect(json[:route][:locations][1][:latLng][:lng]).to be_a(Float)
    expect(json[:route][:locations][1][:latLng][:lat]).to be_a(Float)
  end
end
