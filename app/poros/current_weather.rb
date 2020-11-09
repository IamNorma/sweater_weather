class CurrentWeather
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(weather_params)
    @datetime = format_time(weather_params[:dt])
    @sunrise = format_time(weather_params[:sunrise])
    @sunset = format_time(weather_params[:sunset])
    @temperature = weather_params[:temp]
    @feels_like = weather_params[:feels_like]
    @humidity = weather_params[:humidity]
    @uvi = weather_params[:uvi]
    @visibility = weather_params[:visibility]
    @conditions = weather_params[:weather][0][:description]
    @icon = weather_params[:weather][0][:icon]
  end

  def format_time(unix_time)
    Time.at(unix_time)
  end
end
