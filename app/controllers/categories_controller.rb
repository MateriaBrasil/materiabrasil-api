# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    render json: Category.root.sorted
  end

  def show
    category = Category.friendly.find(params[:id])
    render json: category
  end
end
