# frozen_string_literal: true

class AlbumsController < ApplicationController
  before_action :authenticate_user!, only: %i[create favorites update]

  def favorites
    album = Album.find(params[:id])
    render json: album.favorites
  end

  def show
    album = Album.find(params[:id])
    render json: album
  end

  def update
    album = Album.find(params[:id])
    album.update(album_params)

    render json: album
  end

  def create
    album = Album.create!(
      name: params[:name],
      user: current_user,
      default: false,
      private: false
    )

    render status: :created, json: album
  end

  private

  def album_params
    params.require(:album).permit!
  end
end
