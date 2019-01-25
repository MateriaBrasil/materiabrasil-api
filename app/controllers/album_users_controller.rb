# frozen_string_literal: true

class AlbumUsersController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def create
    user = User.find_by!(email: params[:user_email])
    album = Album.find(params[:album_id])

    album_user = AlbumUser.create!(
      user: user,
      album: album
    )

    render status: :created, json: album_user
  end
end
