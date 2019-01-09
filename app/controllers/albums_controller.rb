# frozen_string_literal: true

class AlbumsController < ApplicationController
  before_action :authenticate_user!, only: %i[create update]

  def favorites
    album = Album.find(params[:id])
    isOwner = current_user == album.user

    if !album.private
      render json: album.favorites
    elsif album.private && isOwner
      render json: album.favorites
    else
      render_unauthorized_error
    end
  end

  def show
    album = Album.find(params[:id])
    isOwner = current_user == album.user

    if !album.private
      render json: album
    elsif album.private && isOwner
      render json: album
    else
      render_unauthorized_error
    end
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

  def render_unauthorized_error
    render json: {
      success: false,
      message: 'Você não tem autorização para ver esse álbum'
    }, status: :unauthorized
  end

  private

  def album_params
    params.require(:album).permit!
  end
end
