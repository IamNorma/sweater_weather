require 'rails_helper'

RSpec.describe 'Background Facade' do
  it 'returns background image data for location' do
    location = 'denver,co'

    background = BackgroundFacade.fetch_image(location)

    expect(background).to be_a(Background)

    expect(background.location).to be_a(String)
    expect(background.width).to be_an(Integer)
    expect(background.height).to be_an(Integer)
    expect(background.color).to be_a(String)
    expect(background.description).to be_a(String)
    expect(background.author_name).to be_a(String)
    expect(background.splash_profile).to be_a(String)
    expect(background.author_instagram).to be_a(String)
    expect(background.author_twitter).to be_a(String)
    expect(background.raw_image_url).to be_a(String)
    expect(background.regular_image_url).to be_a(String)
  end
end
