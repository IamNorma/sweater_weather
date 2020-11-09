class WeatherService
  def self.weather_forecast(latitude, longitude)
    response = conn.get('/data/2.5/onecall') do |req|
      req.params['lat'] = latitude
      req.params['lon'] = longitude
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: 'https://api.openweathermap.org') do |req|
      req.params['appid'] = ENV['WEATHER_API_KEY']
      req.params['lang'] = 'en'
      req.params['units'] = 'imperial'
      req.params['exclude'] = 'minutely,alerts'
    end
  end
end
