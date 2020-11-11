class RoadTripFacade
  def self.fetch_roadtrip_info(origin, destination)
    roadtrip_data = MapService.route(origin, destination)
    if roadtrip_data[:info][:messages].empty?
      latitude = roadtrip_data[:route][:locations][1][:latLng][:lat]
      longitude = roadtrip_data[:route][:locations][1][:latLng][:lng]
      forecast = WeatherService.weather_forecast(latitude, longitude)
      RoadTrip.new(roadtrip_data, forecast, origin, destination)
    else
      RoadTrip.new(roadtrip_data, 'impossible route', origin, destination)
    end
  end
end
