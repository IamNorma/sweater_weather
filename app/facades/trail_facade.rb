class TrailFacade
  def self.fetch_trail_info(location)
    coordinates = MapService.geocode(location)
    latitude = coordinates[:results][0][:locations][0][:latLng][:lat]
    longitude = coordinates[:results][0][:locations][0][:latLng][:lng]
    trail_data = TrailService.trails(latitude, longitude)
    weather = WeatherService.weather_forecast(latitude, longitude)
    forecast = weather[:current]
    Trail.new(trail_data, location, forecast)
  end
end
