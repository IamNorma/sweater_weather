class Trail
  attr_reader :location, :forecast, :trails
  
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

  def nearby_trails(trails)
    trails.map do |trail_data|
      CreateTrail.new(trail_data)
    end
  end
end
