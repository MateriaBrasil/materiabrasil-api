class MaterialCategory < ApplicationRecord
  belongs_to :material
  belongs_to :category

  validates :material, presence: true
  validates :category, presence: true
end
