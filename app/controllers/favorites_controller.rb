# frozen_string_literal: true

class FavoritesController < ApplicationController
  include PolymorphicFind

  before_action :authenticate_user!

  def create
    favorite = Favorite.create!(
      album: album,
      favoritable: polymorphic_find('favoritable')
    )

    render status: :created, json: favorite
  end

  def destroy
    favorite = Favorite.find(params[:id])
    authorize favorite
    favorite.destroy!

    render status: :ok, json: favorite
  end

  private

  def album
    current_user.albums.find_by(id: favorite_params[:album_id]) ||
      current_user.albums.find_by(default: true) ||
      Album.create!(user: current_user, name: 'Favoritos', default: true)
  end

  def favorite_params
    params.require(:favorite).permit(:album_id, :favoritable_type, :favoritable_id)
  end
end
