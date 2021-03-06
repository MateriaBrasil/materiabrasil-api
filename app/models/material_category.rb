# frozen_string_literal: true

class MaterialCategory < ApplicationRecord
  belongs_to :material
  belongs_to :category

  validates :material, presence: true
  validates :category, presence: true

  def as_json(_options = {})
    {
      id: id,
      material_id: material_id,
      category_id: category_id,
      category_name: self.category.name,
      category_slug: self.category.slug,
    }
  end
end
