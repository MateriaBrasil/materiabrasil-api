# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    album = Album.create!(user: current_user, name: 'Favoritos', default: true)
    # album = current_user.albums.find(params[:album_id]) || favorite_album
    favorite = Favorite.create!(
      album: album,
      favoritable: favoritable
    )

    render status: :created, json: favorite
  end

  private

  def favorite_album
    current_user.albums.find_by(default: true) ||
      Album.create!(user: current_user, name: 'Favoritos', default: true)
  end

  def favoritable
    favoritable_type = [Material].find do |type|
      type.name == params[:favoritable_type]
    end

    favoritable_type.find(params[:favoritable_id])
  end

  def favorite_params
    params.require(:favorite).permit!
  end
end
