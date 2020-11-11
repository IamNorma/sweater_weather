class Api::V1::RoadTripController < ApplicationController
  def index
    user = User.find_by(api_key: params[:api_key])
    if user.present?
      roadtrip = RoadTripFacade.fetch_roadtrip_info(params[:origin], params[:destination])
      render json: RoadTripSerializer.new(roadtrip)
    elsif params[:api_key].nil? || user.nil?
      render json: { error: 'Valid API key required' }, status: 401
    end
  end
end
