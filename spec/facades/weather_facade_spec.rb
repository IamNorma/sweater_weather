require 'rails_helper'

RSpec.describe 'Weather Facade' do
  it 'returns weather based on location' do
    location = 'denver,co'

    weather = WeatherFacade.fetch_city_weather(location)

    expect(weather).to be_a(Weather)
    expect(weather.current_weather).to be_a(CurrentWeather)
    expect(weather.daily_weather[0]).to be_a(DailyWeather)
    expect(weather.hourly_weather[0]).to be_a(HourlyWeather)

    expect(weather.current_weather.datetime).to be_a(String)
    expect(weather.current_weather.sunrise).to be_a(String)
    expect(weather.current_weather.sunset).to be_a(String)
    expect(weather.current_weather.temperature).to be_a(Float)
    expect(weather.current_weather.feels_like).to be_a(Float)
    expect(weather.current_weather.humidity).to be_a(Numeric)
    expect(weather.current_weather.uvi).to be_a(Numeric)
    expect(weather.current_weather.visibility).to be_a(Numeric)
    expect(weather.current_weather.conditions).to be_a(String)
    expect(weather.current_weather.icon).to be_a(String)

    expect(weather.daily_weather.first.date).to be_a(String)
    expect(weather.daily_weather.first.sunrise).to be_a(String)
    expect(weather.daily_weather.first.sunset).to be_a(String)
    expect(weather.daily_weather.first.max_temp).to be_a(Float)
    expect(weather.daily_weather.first.min_temp).to be_a(Float)
    expect(weather.daily_weather.first.conditions).to be_a(String)
    expect(weather.daily_weather.first.icon).to be_a(String)

    expect(weather.hourly_weather.first.time).to be_a(String)
    expect(weather.hourly_weather.first.temperature).to be_a(Float)
    expect(weather.hourly_weather.first.wind_speed).to be_a(String)
    expect(weather.hourly_weather.first.wind_direction).to be_a(String)
    expect(weather.hourly_weather.first.conditions).to be_a(String)
    expect(weather.hourly_weather.first.icon).to be_a(String)
  end
end
