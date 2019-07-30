# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    render json: Category.root.by_sorting
  end
end
