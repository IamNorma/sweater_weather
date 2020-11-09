class CreateTrail
  attr_reader :name,
              :summary,
              :difficulty,
              :location,
              :distance_to_trail

  def initialize(trail_params, current_location)
    @name = trail_params[:name]
    @summary = trail_params[:summary]
    @difficulty = trail_params[:difficulty]
    @location = trail_params[:location]
    @distance_to_trail = distance(current_location, trail_params[:location])
  end

  def distance(current_location, trail_location)
    conn = Faraday.new("http://www.mapquestapi.com")
    response = conn.get("/directions/v2/route") do |req|
      req.params['key'] = ENV['MAP_API_KEY']
      req.params['from'] = current_location
      req.params['to'] = trail_location
      req.params['doReverseGeocode'] =  true
    end
    result = JSON.parse(response.body, symbolize_names: true)
    result[:route][:distance].to_s
  end
end
