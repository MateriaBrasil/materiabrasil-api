class Category < ApplicationRecord
  belongs_to :parent, class_name: 'Category', optional: true
  has_many :children, class_name: 'Category', foreign_key: 'parent_id'

  has_many :material_categories
  has_many :materials, through: 'material_categories'

  validates :name, presence: true

  scope :root, -> { where(parent_id: nil) }
end
