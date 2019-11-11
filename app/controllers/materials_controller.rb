# frozen_string_literal: true

class MaterialsController < ApplicationController
  # before_action :authenticate_user!, only: %i[create update destroy]

  def index
    materials = Material
      .where(published: true)
      .order(highlighted: :desc, created_at: :desc)

    categories = params[:categories]
    materials = materials.with_categories(categories).uniq if categories

    render json: materials
  end

  def show
    material = Material.friendly.find(params[:id])
    render json: material
  end

  def create
    material = Material.create!(material_params)
    render status: :created, json: material
  end

  def update
    material = Material.friendly.find(params[:id])
    admins = User.where(admin: true)
    authorize material
    material.update(material_params)

    if params[:material][:pre_published] == true
      admins.each{ |a| MaterialMailer.with(material: material, admin: a).confirmation.deliver_later }     
    end

    render json: material
  end

  def destroy
    material = Material.friendly.find(params[:id])
    authorize material
    material.destroy
  end

  def comments
    material = Material.friendly.find(params[:id])
    render json: material.comments
  end

  def reviews
    material = Material.friendly.find(params[:id])
    render json: material.reviews
  end

  def categories
    material = Material.friendly.find(params[:id])
    render json: material.material_categories
  end

  def answers
    material = Material.friendly.find(params[:id])
    render json: material.answers
  end

  private

  def material_params
    params.require(:material).permit(:name, :image_url, :description, :average_price, :code, :technical_specification_url, :highlighted, :cover_image_url, :highlight_image_url, :list_image_url, :supplier_id, :unit_of_sale, :minimum_purchase_quantity, :maximum_purchase_quantity, :ncm_code, :sh_code, :certifications, :prizes, :density, :dimensions, :availability, :certifications_url, :materiality_driver, :manufacture_driver, :management_driver, :social_driver, :published, :pre_published, :state)
  end
end
