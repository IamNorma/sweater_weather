class RoadTripFacade
  def self.fetch_roadtrip_info(origin, destination)
    roadtrip_data = MapService.route(origin, destination)
    RoadTrip.new(roadtrip_data, forecast)
  end
end
