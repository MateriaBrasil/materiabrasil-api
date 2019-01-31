# frozen_string_literal: true

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
  rescue_from ActiveRecord::InvalidForeignKey, with: :unprocessable_entity
  rescue_from Pundit::NotAuthorizedError, with: :forbidden

  private

  def not_found(exception)
    render status: :not_found, json: {
      id: 'not_found',
      message: exception.message
    }
  end

  def forbidden
    render status: :forbidden, json: {
      id: 'forbidden',
      message: 'You are not allowed to access this resource.'
    }
  end

  def unprocessable_entity(exception)
    render status: :unprocessable_entity, json: {
      id: 'unprocessable_entity',
      message: exception.message
    }
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: %i[first_name last_name email]
    )
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: permitted_account_update_parameters
    )
  end

  def permitted_account_update_parameters
    %i[
      image_url city state country bio company work_title website password
      password_confirmation
    ]
  end
end
