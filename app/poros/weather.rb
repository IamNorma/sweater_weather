class Weather
  attr_reader :current_weather,
              :hourly_weather,
              :daily_weather

  def initialize(weather_params)
    @current_weather = CurrentWeather.new(weather_params[:current])
    @hourly_weather = abridged_hours(weather_params[:hourly])
    @daily_weather = abridged_days(weather_params[:daily])
  end

  def abridged_hours(hourly_weather)
    hourly_weather.first(8).map do |hour_data|
      HourlyWeather.new(hour_data)
    end
  end

  def abridged_days(daily_weather)
    daily_weather.first(5).map do |daily_data|
      DailyWeather.new(daily_data)
    end
  end
end
