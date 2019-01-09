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
    material = Material.find(params[:id])
    material.update(material_params)

    render json: material
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
