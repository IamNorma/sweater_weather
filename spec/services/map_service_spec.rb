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
end
