class Api::V1::ForecastController < ApplicationController
  def index
    weather = WeatherFacade.city_weather(params[:location])
    render json: ForecastSerializer(weather)
  end
end
