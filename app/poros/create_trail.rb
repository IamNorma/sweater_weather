class CreateTrail
  attr_reader :name,
              :summary,
              :difficulty,
              :location,
              :distance_to_trail

  def initialize(trail_params)
    @name = trail_params[:name]
    @summary = trail_params[:summary]
    @difficulty = trail_params[:difficulty]
    @location = trail_params[:location]
    @distance_to_trail = distance(trail_params[:name])
  end
end
