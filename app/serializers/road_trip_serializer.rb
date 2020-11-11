class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  set_id { }
  set_type 'roadtrip'
  attributes :start_city, :end_city, :travel_time
  attribute :weather_at_eta do |object|
    {
      temperature: object.temperature,
      conditions: object.conditions
    }
  end
end
