# frozen_string_literal: true

class AlbumsController < ApplicationController
  before_action :authenticate_user!
  
  def favorites
    album = Album.find(params[:id])
    render json: album.favorites
  end

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
