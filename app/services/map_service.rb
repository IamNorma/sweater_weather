class MapService
  def self.geocode(location)
    conn = Faraday.new(url: 'http://www.mapquestapi.com') do |req|
      req.params['key'] = ENV['MAP_API_KEY']
    end

    response = conn.get('/geocoding/v1/address') do |req|
      req.params['location'] = location
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
