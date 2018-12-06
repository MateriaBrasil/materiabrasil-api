# frozen_string_literal: true

class SearchesController < ApplicationController
  include PgSearch
  PgSearch.multisearch_options = {
    using: {
      trigram: {
        threshold: 0.03
      },
      tsearch: { any_word: true, prefix: true }
    },
    ignoring: :accents
  }

  def filter(results)
    results.select { |material| material.published == true }
  end

  def show
    search = PgSearch.multisearch(params[:term])
    search = with_categories(search, params[:categories]) if params[:categories]

    results = filter(search.map(&:searchable))

    return not_found if results.empty?

    render json: results
  end

  private

  def with_categories(search, ids)
    search.where(
      "searchable_type = 'Material' AND searchable_id IN" \
      '(SELECT material_id FROM material_categories WHERE category_id IN ' \
      "(#{ids.join(',')}))"
    )
  end

  def not_found
    render status: :not_found, json: {
      id: 'not_found',
      message: 'Nenhum resultado encontrado.'
    }
  end
end
