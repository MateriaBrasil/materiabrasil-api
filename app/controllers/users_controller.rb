# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[update]
  rescue_from ActiveRecord::RecordNotUnique, with: :not_unique

  def show
    user = User.find(params[:id])
    authorize user

    render json: user.as_json(only_public_albums: true)
  end

  def update
    email = user_params['email']
    params = email.present? ? user_params.merge(uid: email) : user_params
    current_user.update(params)
    render json: current_user
  end

  private

  def user_params
    params.require(:user).permit!
  end

  def not_unique
    render json: {
      id: 'used_email',
      message: 'Este e-mail já está em uso. Escolha outro e-mail por favor.'
    }, status: :conflict
  end
end
