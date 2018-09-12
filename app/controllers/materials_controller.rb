# frozen_string_literal: true

class MaterialsController < ApplicationController
  before_action :authenticate_user!, only: %i[create update]

  def index
    materials = Material.all.order(highlighted: :desc, created_at: :desc)

    categories = params[:categories]
    materials = materials.with_categories(categories) if categories

    render json: materials
  end

  def show
    material = Material.find(params[:id])
    render json: material
  end

  def create
    material = Material.create!(material_params)
    render status: :created, json: material
  end

  def update
    material = Material.find(params[:id])
    material.update(material_params)

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

  def categories
    material = Material.find(params[:id])
    render json: material.material_categories
  end

  private

  def material_params
    params.require(:material).permit!
  end
end
