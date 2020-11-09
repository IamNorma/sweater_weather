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
    @wind_direction = format_wind_direction(weather_params[:wind_deg])
    @conditions = weather_params[:weather][0][:description]
    @icon = weather_params[:weather][0][:icon]
  end

  def format_time(unix_time)
    Time.at(unix_time).strftime('%k:%M:%S')
  end

  def format_wind_speed(wind_speed)
    wind_speed.to_s + ' mph'
  end

  def format_wind_direction(degree)
    return 'N' if (degree.between?(348.75, 11.25) || degree.between?(0.0, 11.25)) ||
    (degree == 11.25 || degree == 0.0)
    return 'NNE' if degree.between?(11.25, 33.75) || degree == 33.75
    return 'NE' if degree.between?(33.75, 56.25) || degree == 56.25
    return 'ENE' if degree.between?(56.25, 78.75) || degree == 78.75
    return 'E' if degree.between?(78.75, 101.25) || degree == 101.25
    return 'ESE' if degree.between?(101.25, 123.75) || degree == 123.75
    return 'SE' if degree.between?(123.75, 146.25) || degree == 146.25
    return 'SSE' if degree.between?(146.25, 168.75) || degree == 168.75
    return 'S' if degree.between?(168.75, 191.25) || degree == 191.25
    return 'SSW' if degree.between?(191.25, 213.75) || degree == 213.75
    return 'SW' if degree.between?(213.75, 236.25) || degree == 236.25
    return 'WSW' if degree.between?(236.25, 258.75) || degree == 258.75
    return 'W' if degree.between?(258.75, 281.25) || degree == 281.25
    return 'WNW' if degree.between?(281.25, 303.75) || degree == 303.75
    return 'NW' if degree.between?(303.75, 326.25) || degree == 326.25
    return 'NNW' if degree.between?(326.25, 348.75) || degree == 348.75
  end
end
