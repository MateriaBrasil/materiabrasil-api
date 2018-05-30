# frozen_string_literal: true

class Material < ApplicationRecord
  validates :name, :image_url, :description, :average_price, :code,
    presence: true

  def as_json(_options = {})
    {
      id: id,
      name: name,
      image_url: image_url,
      description: description,
      average_price: average_price,
      code: code
    }
  end
end
