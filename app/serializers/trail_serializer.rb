class TrailSerializer
  include FastJsonapi::ObjectSerializer
  set_id { }
  set_type :trail
  attributes :location, :forecast, :trails
end
