# frozen_string_literal: true

class SearchesController < ApplicationController
  include PgSearch

  def show
    
    materials_passed = []
    
    if params[:materials_passed]      
      materials_passed = params[:materials_passed].split(',')
    end

    results = Material.where(published: true).where.not(id: [materials_passed]).order(highlighted: :desc, created_at: :desc).search(params[:term]).order('RANDOM()').order(highlighted: :desc).limit(9)
    
    # Search if categories are present
    if params[:categories]
      results = results.joins(:categories).where.not(id: [materials_passed]).where(
        categories: { id: params[:categories] }
      ).order('RANDOM()').order(highlighted: :desc).limit(9)
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
