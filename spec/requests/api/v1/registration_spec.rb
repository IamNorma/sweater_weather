require 'rails_helper'

describe "User registration" do
  it "can register a new user" do
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    params = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }

    post '/api/v1/users', headers: headers, params: JSON.generate(params)

    expect(response).to be_successful
    expect(response.status).to eq(201)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data]).to be_a(Hash)

    expect(json[:data]).to have_key(:type)
    expect(json[:data]).to have_key(:id)
    expect(json[:data]).to have_key(:attributes)

    expect(json[:data][:type]).to be_a(String)
    expect(json[:data][:type]).to eq('users')
    expect(json[:data][:id]).to be_a(String)
    expect(json[:data][:attributes]).to be_a(Hash)

    expect(json[:data][:attributes]).to have_key(:email)
    expect(json[:data][:attributes][:email]).to be_a(String)
    expect(json[:data][:attributes]).to have_key(:api_key)
    expect(json[:data][:attributes][:api_key]).to be_a(String)

    expect(json[:data][:id]).to_not eq(nil)
    expect(json[:data][:attributes]).to_not have_key(:password)
    expect(json[:data][:attributes]).to_not have_key(:password_confirmation)
  end

  it "will give an error with missing info" do
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    params = {
      "password": "password",
      "password_confirmation": "password"
    }

    post '/api/v1/users', headers: headers, params: JSON.generate(params)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(401)
    expect(json[:error]).to eq("Email can't be blank")
  end

  it "will give an error if email already exists" do
    User.create!(email: 'whatever@example.com', password: '123pass', password_confirmation: '123pass')

    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    params = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }

    post '/api/v1/users', headers: headers, params: JSON.generate(params)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(401)
    expect(json[:error]).to eq("Email has already been taken")
  end

  it "will give an error if passwords do not match" do
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    params = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "passwordddd"
    }

    post '/api/v1/users', headers: headers, params: JSON.generate(params)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(401)
    expect(json[:error]).to eq("Password confirmation doesn't match Password")
  end
end
