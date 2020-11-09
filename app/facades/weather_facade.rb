class WeatherFacade
  def self.fetch_city_weather(location)
    coordinates = MapService.geocode(location)
    data = WeatherService.weather_forecast(coordinates)
    Weather.new(data)
  end
end
