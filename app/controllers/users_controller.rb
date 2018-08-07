# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[update]

  def show
    user = User.find(params[:id])
    authorize user

    render json: user
  end

  def update
    current_user.update(user_params)

    render json: current_user
  end

  private

  def user_params
    params.require(:user).permit!
  end
end
