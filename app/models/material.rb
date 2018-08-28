# frozen_string_literal: true

class Material < ApplicationRecord
  include PgSearch

  multisearchable against: %i[
    name description code properties usage
  ]

  validates :name, :description, :average_price, :code, :properties,
    :usage, presence: true

  has_many :comments,
    as: :commentable,
    inverse_of: :commentable,
    dependent: :restrict_with_exception

  has_many :reviews,
    as: :reviewable,
    inverse_of: :reviewable,
    dependent: :restrict_with_exception

  has_many :favorites,
    as: :favoritable,
    inverse_of: :favoritable,
    dependent: :restrict_with_exception

  belongs_to :supplier

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def as_json(_options = {})
    {
      id: id,
      name: name,
      image_url: image_url,
      description: description,
      average_price: average_price,
      code: code,
      technical_specification_url: technical_specification_url,
      properties: properties,
      usage: usage,
      average_rating: average_rating,
      highlighted: highlighted,
      cover_image_url: cover_image_url,
      highlight_image_url: highlight_image_url,
      list_image_url: list_image_url,
      supplier_id: supplier.id,
      supplier_name: supplier.name
    }
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize

  def average_rating
    average = reviews.average('rating')
    average && average.to_f.round(2)
  end
end
