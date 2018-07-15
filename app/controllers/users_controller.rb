# frozen_string_literal: true

class UsersController < ApplicationController
  rescue_from Pundit::NotAuthorizedError, with: :profile_not_public

  def show
    user = User.find(params[:id])
    authorize user

    render json: user
  end

  private

  def profile_not_public
    render status: :forbidden, json: {
      id: 'forbidden',
      message: 'Perfil privado'
    }
  end
end
