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
end
