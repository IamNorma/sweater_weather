class ImageService
  def self.search(location)
    response = conn.get('/search/photos') do |req|
      req.params['query'] = location
      req.params['per_page'] = 1
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: 'https://api.unsplash.com') do |req|
      req.headers['Authorization'] = "Client-ID #{ENV['IMAGE_API_KEY']}"
    end
  end
end
