# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[update]

  def show
    user = User.find(params[:id])
    authorize user

    render json: user
  end

  def update
    email = user_params['email']
    return conflict_response if conflict? email
    params = email.present? ? user_params.merge(uid: email) : user_params
    current_user.update(params)
    render json: current_user
  end

  private

  def conflict?(email)
    email != current_user.email && User.find_by(email: email)
  end

  def user_params
    params.require(:user).permit!
  end

  def conflict_response
    render json: {
      id: 'used_email',
      message: 'Este e-mail já está em uso. Escolha outro e-mail por favor.'
    }, status: :conflict
  end
end
