class Trail
  def initialize(trail_params, location, forecast)
    @location = location
    @forecast = temperature_summary(forecast)
    @trails = nearby_trails(trail_params[:trails])
  end
end
