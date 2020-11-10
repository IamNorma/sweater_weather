class Background
  attr_reader :location,
              :width,
              :height,
              :color,
              :description,
              :author_name,
              :splash_profile,
              :author_instagram,
              :author_twitter,
              :raw_image_url,
              :regular_image_url

  def initialize(image_params, location)
    @location = location
    @width = image_params[:width]
    @height = image_params[:height]
    @color = image_params[:color]
    @description = image_params[:description]
    @author_name = image_params[:user][:name]
    @splash_profile = image_params[:user][:links][:html]
    @author_instagram = image_params[:user][:instagram_username]
    @author_twitter = image_params[:user][:twitter_username]
    @raw_image_url = image_params[:urls][:raw]
    @regular_image_url = image_params[:urls][:regular]
  end
end
