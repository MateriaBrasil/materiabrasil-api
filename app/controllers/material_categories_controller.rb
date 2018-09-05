# frozen_string_literal: true

class MaterialCategoriesController < ApplicationController
  before_action :authenticate_user!

  def create
    material = Material.find(params[:material_id])
    category = Category.find(params[:category_id])
    single_choice = !category.parent&.multiple_choice

    destroy_siblings(material, category) if single_choice

    material_category = MaterialCategory.create!(
      material: material,
      category: category
    )

    render status: :created, json: material_category
  end

  def destroy
    association = MaterialCategory.find(params[:id])
    association.destroy!

    render status: :ok, json: association
  end

  private

  def destroy_siblings(material, category)
    return unless category.parent

    material.material_categories
      .joins(:category).where(categories: { parent_id: category.parent.id })
      .destroy_all
  end
end
