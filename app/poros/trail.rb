class Trail
  def initialize(trail_params, location, forecast)
    @location = location
    @forecast = temperature_summary(forecast)
    @trails = nearby_trails(trail_params[:trails])
  end

  def temperature_summary(forecast)
    {
    "summary": forecast[:weather][0][:description],
    "temperature": forecast[:temp].to_s
    }
  end
end
