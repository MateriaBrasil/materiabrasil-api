# frozen_string_literal: true

class AlbumsController < ApplicationController
  def favorites
    album = Album.find(params[:id])
    render json: album.favorites
  end
end
