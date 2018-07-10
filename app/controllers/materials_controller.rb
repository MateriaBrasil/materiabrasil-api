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

  def comments
    material = Material.find(params[:id])
    render json: material.comments
  end

  def reviews
    material = Material.find(params[:id])
    render json: material.reviews
  end
end
