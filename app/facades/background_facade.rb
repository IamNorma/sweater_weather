class BackgroundFacade
  def self.fetch_image(location)
    image_data = ImageService.search(location)
    Background.new(image_data[:results][0])
  end
end
