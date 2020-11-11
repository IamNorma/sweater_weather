class RoadTrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :temperature,
              :conditions

  def initialize(roadtrip_params, forecast, origin, destination)
    @start_city = origin
    @end_city = destination
    @travel_time = format_time(roadtrip_params[:route][:realTime])
    @temperature = find_temp(forecast, roadtrip_params[:route][:realTime])
    @conditions = find_conditions(forecast, roadtrip_params[:route][:realTime])
  end

  def format_time(time)
    hour = (time / 3600)
    minutes = (time / 60) % 60
    "#{hour}h#{minutes}m"
  end

  def find_temp(forecast_data, travel_time)
    nearest_hour(forecast_data, travel_time)[:temp]
  end

  def find_conditions(forecast_data, travel_time)
    nearest_hour(forecast_data, travel_time)[:weather][0][:description]
  end

  def nearest_hour(forecast_data, travel_time)
    current_unix_time = forecast_data[:current][:dt] + travel_time
    difference = forecast_data[:hourly].map do |hour|
      (current_unix_time - hour[:dt]).abs
    end.min
    nearest_hour = forecast_data[:hourly].find do |hour|
      (current_unix_time - hour[:dt]).abs == difference
    end
  end
end
