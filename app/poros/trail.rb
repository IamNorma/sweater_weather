class Trail
  def initialize(trail_params)
    @trails = nearby_trails(trail_params[:trails])
  end
end
