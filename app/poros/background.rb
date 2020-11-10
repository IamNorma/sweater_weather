class Background
  def initialize(image_params)
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
