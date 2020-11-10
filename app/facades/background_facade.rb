class BackgroundFacade
  def self.fetch_image(location)
    imagae_data = ImageService.search(location)
    Background.new(image_data)
  end
end
