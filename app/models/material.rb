# frozen_string_literal: true

class Material < ApplicationRecord
  validates :name, :image_url, :description, :average_price, :code,
    :supplier_name, :supplier_contact, :manufacturing_location,
    :sales_location, :technical_specification_url, :properties, :usage,
    presence: true

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

  # rubocop:disable Metrics/MethodLength
  def as_json(_options = {})
    {
      id: id,
      name: name,
      image_url: image_url,
      description: description,
      average_price: average_price,
      code: code,
      supplier_name: supplier_name,
      supplier_contact: supplier_contact,
      manufacturing_location: manufacturing_location,
      sales_location: sales_location,
      technical_specification_url: technical_specification_url,
      properties: properties,
      usage: usage,
      average_rating: average_rating,
      highlighted: highlighted
    }
  end
  # rubocop:enable Metrics/MethodLength

  def average_rating
    average = reviews.average('rating')
    average && average.to_f.round(2)
  end
end
