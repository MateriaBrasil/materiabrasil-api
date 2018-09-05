# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    categories = Category.root
    render json: categories
  end
end
