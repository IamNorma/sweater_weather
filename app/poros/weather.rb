class Weather
  attr_reader :current, :hourly, :daily
  
  def initialize(weather_params)
    @current_weather = CurrentWeather.new(weather_params[:current])
    @hourly_weather = next_eight_hours(weather_params[:hourly])
    @daily_weather = next_five_days(weather_params[:daily])
  end
end
