# frozen_string_literal: true

module Auth
  class PasswordsController < DeviseTokenAuth::PasswordsController
    skip_before_action :set_user_by_token, only: [:update]
    before_action :set_user_by_reset_token, only: [:update]

    def update
      super
    end

    def set_user_by_reset_token
      return if resource_params[:reset_password_token].nil?
      @resource = with_reset_password_token(
        resource_params[:reset_password_token]
      )

      if @resource&.reset_password_period_valid?
        bypass_sign_in(@resource)
      else
        render_expired_error
      end
    end

    private

    def render_expired_error
      render json: {
        success: false,
        message: expired_message
      }, status: :unauthorized
    end

    def render_edit_error
      render json: {
        success: false,
        message: expired_message
      }, status: :not_found
    end

    def expired_message
      'O pedido de troca de senha expirou, por favor, tente novamente.'
    end
  end
end
