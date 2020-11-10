require 'rails_helper'

RSpec.describe ImageService do
  it 'fetch image from query' do
    location = 'denver,co'
    json = ImageService.search(location)

    expect(json).to be_a(Hash)
    expect(json).to have_key(:results)
    expect(json[:results]).to be_an(Array)

    expect(json[:results][0]).to have_key(:id)
    expect(json[:results][0]).to have_key(:created_at)
    expect(json[:results][0]).to have_key(:width)
    expect(json[:results][0]).to have_key(:height)
    expect(json[:results][0]).to have_key(:color)
    expect(json[:results][0]).to have_key(:blur_hash)
    expect(json[:results][0]).to have_key(:likes)
    expect(json[:results][0]).to have_key(:liked_by_user)
    expect(json[:results][0]).to have_key(:description)
    expect(json[:results][0]).to have_key(:user)
    expect(json[:results][0]).to have_key(:urls)


    expect(json[:results][0][:id]).to be_a(String)
    expect(json[:results][0][:created_at]).to be_a(String)
    expect(json[:results][0][:width]).to be_a(Integer)
    expect(json[:results][0][:height]).to be_a(Integer)
    expect(json[:results][0][:color]).to be_a(String)
    expect(json[:results][0][:blur_hash]).to be_a(String)
    expect(json[:results][0][:likes]).to be_a(Integer)
    expect(json[:results][0][:description]).to be_a(String)
    expect(json[:results][0][:user]).to be_a(Hash)
    expect(json[:results][0][:urls]).to be_a(Hash)

    expect(json[:results][0][:user]).to have_key(:username)
    expect(json[:results][0][:user]).to have_key(:name)
    expect(json[:results][0][:user]).to have_key(:instagram_username)
    expect(json[:results][0][:user]).to have_key(:twitter_username)
    expect(json[:results][0][:user]).to have_key(:links)
    expect(json[:results][0][:user][:links]).to have_key(:html)

    expect(json[:results][0][:user][:username]).to be_a(String)
    expect(json[:results][0][:user][:name]).to be_a(String)
    expect(json[:results][0][:user][:instagram_username]).to be_a(String)
    expect(json[:results][0][:user][:twitter_username]).to be_a(String)
    expect(json[:results][0][:user][:links]).to be_a(Hash)
    expect(json[:results][0][:user][:links][:html]).to be_a(String)

    expect(json[:results][0][:urls]).to have_key(:raw)
    expect(json[:results][0][:urls]).to have_key(:regular)

    expect(json[:results][0][:urls][:raw]).to be_a(String)
    expect(json[:results][0][:urls][:regular]).to be_a(String)
  end
end
