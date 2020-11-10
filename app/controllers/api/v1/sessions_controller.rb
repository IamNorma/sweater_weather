class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: UsersSerializer.new(user)
    else
      render json: { error: 'The email and password provided did not match our records. Please try again.' }, status: 400
    end
  end
end
