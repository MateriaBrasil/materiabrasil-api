# frozen_string_literal: true

class MaterialCategoriesController < ApplicationController
  before_action :authenticate_user!

  def create
    material = Material.find(params[:material_id])
    category = Category.find(params[:category_id])

    material_category = MaterialCategory.create!(
      material: material,
      category: category
    )

    render status: :created, json: material_category
  end
end
