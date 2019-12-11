# frozen_string_literal: true

class SearchesController < ApplicationController
  include PgSearch

  def show
    results = Material.where(published: true).order(highlighted: :desc, created_at: :desc).search(params[:term]).page(params[:page]).per(params[:per_page])
    # Search if categories are present
    if params[:categories]
      results = results.joins(:categories).where(
        categories: { id: params[:categories] }
      ).order(highlighted: :desc, created_at: :desc).page(params[:page]).per(params[:per_page])
    end

    return not_found if results.empty?

    render json: results
  end

  private

  def not_found
    render status: :not_found, json: {
      id: 'not_found',
      message: 'Nenhum resultado encontrado.'
    }
  end
end
