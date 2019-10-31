# frozen_string_literal: true

class AlbumsController < ApplicationController
  before_action :authenticate_user!, only: %i[create update]

  def favorites
    album = Album.find(params[:id])
    authorize album
    render json: album.favorites
  end

  def show
    album = Album.find(params[:id])
    authorize album
    render json: album
  end

  def update
    album = Album.find(params[:id])
    authorize album
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
    params.require(:album).permit(:user_id, :name, :default, :private)
  end
end
