class WeatherFacade
  def self.fetch_city_weather(location)
    coordinates = MapService.geocode(location)
    latitude = coordinates[:results][0][:locations][0][:latLng][:lat]
    longitude = coordinates[:results][0][:locations][0][:latLng][:lng]
    weather_data = WeatherService.weather_forecast(latitude, longitude)
    Weather.new(weather_data)
  end
end
