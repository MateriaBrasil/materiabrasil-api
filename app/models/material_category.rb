class MaterialCategory < ApplicationRecord
  belongs_to :material
  belongs_to :category

  validates :material, presence: true
  validates :category, presence: true

  def as_json(_options = {})
    {
      id: id,
      material_id: material_id,
      category_id: category_id
    }
  end
end
