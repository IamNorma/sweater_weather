class HourlyWeather
  attr_reader :time,
              :temperature,
              :wind_speed,
              :wind_direction,
              :conditions,
              :icon

  def initialize(weather_params)
    @time = format_time(weather_params[:dt])
    @temperature = weather_params[:temp]
    @wind_speed = format_wind_speed(weather_params[:wind_speed])
    @wind_direction = format_wind_direction(weather_params[:temp])
    @conditions = weather_params[:weather][0][:description]
    @icon = weather_params[:weather][0][:icon]
  end

  def format_time(unix_time)
    Time.at(unix_time).strftime('%k:%M:%S')
  end

  def format_wind_speed(wind_speed)
    wind_speed.to_s + ' mph'
  end
end
