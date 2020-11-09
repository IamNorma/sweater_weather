require 'rails_helper'

RSpec.describe TrailService do
  it 'fetch nearby trails from address' do
    latitude = 38.892062
    longitude = -77.019912
    
    json = TrailService.trails(latitude, longitude)

    expect(json).to be_a(Hash)
    expect(json).to have_key(:trails)
    expect(json[:trails]).to be_an(Array)

    expect(json[:trails][0]).to have_key(:name)
    expect(json[:trails][0][:name]).to be_a(String)
    expect(json[:trails][0]).to have_key(:summary)
    expect(json[:trails][0][:summary]).to be_a(String)
    expect(json[:trails][0]).to have_key(:difficulty)
    expect(json[:trails][0][:difficulty]).to be_a(String)
    expect(json[:trails][0]).to have_key(:location)
    expect(json[:trails][0][:location]).to be_a(String)
  end
end
