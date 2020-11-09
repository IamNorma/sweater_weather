class Weather
  attr_reader :current, :hourly, :daily

  def initialize(weather_params)
    @current_weather = CurrentWeather.new(weather_params[:current])
    @hourly_weather = abridged_hours(weather_params[:hourly])
    @daily_weather = next_five_days(weather_params[:daily])
  end

  def abridged_hours(hourly_weather)
    hourly_weather.first(8).map do |hour_data|
      HourlyWeather.new(hour_data)
    end
  end
end
