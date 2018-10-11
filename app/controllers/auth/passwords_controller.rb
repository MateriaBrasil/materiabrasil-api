# frozen_string_literal: true

module Auth
  class PasswordsController < DeviseTokenAuth::PasswordsController
    skip_before_action :set_user_by_token, only: %i[update edit]
    before_action :set_user_by_reset_token, only: %i[edit update]

    def update
      super
    end

    def edit
      # if a user is not found, return nil
      @resource = User.with_reset_password_token(
        resource_params[:reset_password_token]
      )
      if @resource&.reset_password_period_valid?
        client_id, token = @resource.create_token

        # ensure that user is confirmed
        @resource.skip_confirmation! if confirmable_enabled? && !@resource.confirmed_at

        # allow user to change password once without current_password
        @resource.allow_password_change = true if recoverable_enabled?

        @resource.save!

        yield @resource if block_given?

        redirect_header_options = {
          reset_password: true,
          reset_password_token: resource_params[:reset_password_token]
        }
        redirect_headers = build_redirect_headers(token,
          client_id,
          redirect_header_options)
        redirect_to(@resource.build_auth_url(params[:redirect_url],
          redirect_headers))
      else
        render_edit_error
      end
    end

    def set_user_by_reset_token
      return if resource_params[:reset_password_token].nil?
      @resource = User.with_reset_password_token(
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
