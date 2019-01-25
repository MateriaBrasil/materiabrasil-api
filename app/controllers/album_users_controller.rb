# frozen_string_literal: true

class AlbumUsersController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def create
    user = User.find_by!(email: params[:user_email])
    return render_error('Usuário não encontrado na plataforma.') unless user

    album = Album.find(params[:album_id])

    album_user = AlbumUser.create!(
      user: user,
      album: album
    )

    render json: album_user
  end

  private

  def render_error(message)
    render status: :error, json: {
      id: 'error',
      message: message
    }
  end
end
