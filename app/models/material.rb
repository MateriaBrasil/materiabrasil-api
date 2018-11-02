# frozen_string_literal: true

class Material < ApplicationRecord
  include PgSearch

  multisearchable against: %i[
    name description code ncm_code sh_code density dimensions availability
  ]

  validates :name, :description, :average_price, :code, presence: true

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

  has_many :material_categories, dependent: :destroy
  has_many :categories, through: 'material_categories'

  belongs_to :supplier

  def self.with_categories(ids)
    where(
      'id IN (SELECT material_id FROM material_categories WHERE category_id ' \
      "IN (#{ids.join(',')}))"
    )
  end

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
      average_rating: average_rating,
      highlighted: highlighted,
      cover_image_url: cover_image_url,
      highlight_image_url: highlight_image_url,
      list_image_url: list_image_url,
      supplier_id: supplier.id,
      supplier_name: supplier.name,
      unit_of_sale: unit_of_sale,
      minimum_purchase_quantity: minimum_purchase_quantity,
      maximum_purchase_quantity: maximum_purchase_quantity,
      ncm_code: ncm_code,
      sh_code: sh_code,
      certifications: certifications,
      certifications_url: certifications_url,
      prizes: prizes,
      density: density,
      dimensions: dimensions,
      availability: availability,
      first_driver: first_driver,
      second_driver: second_driver,
      third_driver: third_driver,
      fourth_driver: fourth_driver,
      visible: visible
    }
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize

  def average_rating
    average = reviews.average('rating')
    average && average.to_f.round(2)
  end
end
