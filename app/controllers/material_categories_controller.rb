# frozen_string_literal: true

class MaterialCategoriesController < ApplicationController
  before_action :authenticate_user!

  def create
    material = Material.find(params[:material_id])
    category = Category.find(params[:category_id])
    root = root_category(category)
    single_choice = !root.multiple_choice

    delete_children(material, root) if single_choice

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

  def root_category(category)
    return category unless category.parent

    root_category(category.parent)
  end

  def delete_children(material, category)
    material.material_categories
      .joins(:category).where(categories: { parent_id: category.id })
      .delete_all

    category.children.each do |child|
      delete_children(material, child)
    end
  end
end
