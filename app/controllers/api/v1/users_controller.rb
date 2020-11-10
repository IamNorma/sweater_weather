class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: UsersSerializer(user), status: 201
    else
      render json: { error: user.errors.full_messages.to_sentence }, status: 401
    end
  end
end
