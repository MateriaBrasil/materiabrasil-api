# frozen_string_literal: true

class AlbumsController < ApplicationController
  before_action :authenticate_user!, only: %i[create favorites]

  def favorites
    album = Album.find(params[:id])
    render json: album.favorites
  end

  def show
    album = Album.find(params[:id])
    render json: album
  end

  def create
    album = Album.create!(
      name: params[:name],
      user: current_user,
      default: false
    )

    render status: :created, json: album
  end
end
