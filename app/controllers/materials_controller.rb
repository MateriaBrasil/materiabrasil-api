# frozen_string_literal: true

class MaterialsController < ApplicationController
  def index
    materials = Material.all
    render json: materials
  end

  def show
    material = Material.find(params[:id])
    render json: material
  end
end
