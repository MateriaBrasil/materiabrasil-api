# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    render json: Category.root.sorted
  end
end
