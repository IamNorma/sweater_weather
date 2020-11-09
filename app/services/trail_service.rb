class TrailService
  def self.trails(latitude, longitude)
    response = conn.get('/data/get-trails') do |req|
      req.params['lat'] = latitude
      req.params['lon'] = longitude
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: 'https://www.hikingproject.com') do |req|
      req.params['key'] = ENV['HIKING_API_KEY']
    end
  end
end
