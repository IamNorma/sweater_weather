class WeatherFacade
  def self.fetch_city_weather(location)
    coordinates = MapService.geocode(location)
    weather_data = WeatherService.weather_forecast(coordinates)
    Weather.new(weather_data)
  end
end
