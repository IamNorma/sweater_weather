class DailyWeather
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(weather_params)
    @date = format_date(weather_params[:dt])
    @sunrise = format_datetime(weather_params[:sunrise])
    @sunset = format_datetime(weather_params[:sunset])
    @max_temp = weather_params[:temp][:max]
    @min_temp = weather_params[:temp][:min]
    @conditions = weather_params[:weather][0][:description]
    @icon = weather_params[:weather][0][:icon]
  end

  def format_date(unix_time)
    Time.at(unix_time).strftime('%Y-%m-%d')
  end

  def format_datetime(unix_time)
    Time.at(unix_time)
  end
end
