class RoadTrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :temperature,
              :conditions

  def initialize(roadtrip_params, forecast)
    @start_city = find_start_city(roadtrip_params[:route][:locations])
    @end_city = find_end_city(roadtrip_params[:route][:locations])
    @travel_time = format_time(roadtrip_params[:route][:realTime])
    @temperature = find_temp(forecast)
    @conditions = find_conditions(forecast)
  end

  def find_start_city(data)
    data[0][:adminArea5] + ', ' + data[0][:adminArea3]
  end
end
