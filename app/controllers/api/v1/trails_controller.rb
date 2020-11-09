class Api::V1::TrailsController < ApplicationController
  def index
    trail = TrailFacade.fetch_trail_info(params[:location])
    render json: TrailSerializer.new(trail)
  end
end
