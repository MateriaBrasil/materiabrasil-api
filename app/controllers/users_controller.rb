# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[update]
  rescue_from ActiveRecord::RecordNotUnique, with: :not_unique

  def show
    user = User.find(params[:id])
    authorize user

    render json: user.as_json(only_public_albums: current_user != user)
  end

  def update
    email = user_params['email']
    params = email.present? ? user_params.merge(uid: email) : user_params
    current_user.update(params)
    render json: current_user
  end

  private

  def user_params
    params.require(:user).permit(:provider, :uid, :encrypted_password, :reset_password_token, :reset_password_sent_at, :allow_password_change, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email, :first_name, :email, :tokens, :public_profile, :last_name, :image_url, :city, :state, :country, :newsletter, :bio, :company, :work_title, :website, :iugu_id, :admin)
  end

  def not_unique
    render json: {
      id: 'used_email',
      message: 'Este e-mail já está em uso. Escolha outro e-mail por favor.'
    }, status: :conflict
  end
end
