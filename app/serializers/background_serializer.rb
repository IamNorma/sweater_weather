class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  set_id { }
  set_type :background
  attributes :location, :width, :height, :color, :description
  attribute :author do |object|
    {
      name: object.author_name,
      splash_profile: object.splash_profile,
      instagram_username: object.author_instagram,
      twitter_username: object.author_twitter
    }
  end
  attribute :urls do |object|
    {
      raw: object.raw_image_url,
      regular: object.regular_image_url
    }
  end
end
