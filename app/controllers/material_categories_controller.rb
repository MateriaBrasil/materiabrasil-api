# frozen_string_literal: true

class MaterialCategoriesController < ApplicationController
  before_action :authenticate_user!

  # rubocop:disable Metrics/MethodLength
  def create
    material = Material.find(params[:material_id])
    category = Category.find(params[:category_id])
    material_category = MaterialCategory.new(
      material: material, category: category
    )

    authorize(material_category)

    root = root_category(category)
    single_choice = !root.multiple_choice

    delete_children(material, root) if single_choice

    material_category.save!
    render status: :created, json: material_category
  end
  # rubocop:enable Metrics/MethodLength

  def destroy
    material_category = MaterialCategory.find(params[:id])
    authorize(material_category)
    material_category.destroy!

    render status: :ok, json: material_category
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
