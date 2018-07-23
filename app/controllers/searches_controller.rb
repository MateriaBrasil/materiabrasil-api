# frozen_string_literal: true

class SearchesController < ApplicationController
  include PgSearch

  def show
    search = PgSearch.multisearch(params[:term])
    return not_found if search.empty?

    results = search.map(&:searchable)
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
