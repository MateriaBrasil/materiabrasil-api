# frozen_string_literal: true

class AlbumsController < ApplicationController
  def favorites
    album = Album.find(params[:id])
    render json: album.favorites
  end

  before_action :authenticate_user!

  def create
    album = Album.create!(
      name: album_params[:name],
      user: current_user,
      default: false
    )

    render status: :created, json: album
  end

  private

  def album_params
    params.require(:album).permit!
  end
end
