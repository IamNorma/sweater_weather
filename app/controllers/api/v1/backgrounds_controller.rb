class Api::V1::BackgroundsController < ApplicationController
  def index
    background = BackgroundFacade.fetch_image(params[:location])
    render json: BackgroundSerializer.new(background)
  end
end
