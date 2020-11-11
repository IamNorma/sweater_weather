class Api::V1::RoadTripController < ApplicationController
  def index
    user = User.find_by(api_key: params[:api_key])
    if user.present?
      roadtrip = RoadTripFacade.fetch_roadtrip_info(origin, destination)
      render json: RoadTripSerializer.new(roadtrip)
    end
  end
end
