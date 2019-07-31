# frozen_string_literal: true

class SearchesController < ApplicationController
  include PgSearch

  def show
    search = Material.where(published: true).search(params[:term])
    # Search if categories are present
    if params[:categories]
      search = search.joins(:categories).where(
        categories: { id: params[:categories] }
      )
    end

    return not_found if search.empty?

    render json: search
  end

  private

  def not_found
    render status: :not_found, json: {
      id: 'not_found',
      message: 'Nenhum resultado encontrado.'
    }
  end
end
