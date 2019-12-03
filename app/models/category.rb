# frozen_string_literal: true

class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :parent,
    class_name: 'Category',
    optional: true,
    inverse_of: :children

  has_many :children,
    class_name: 'Category',
    foreign_key: 'parent_id',
    inverse_of: :parent,
    dependent: :restrict_with_exception

  has_many :material_categories, dependent: :destroy

  has_many :materials, through: 'material_categories'

  validates :name, presence: true

  scope :root, -> { where(parent_id: nil) }
  scope :sorted, -> { order(sorting: :asc) }
  scope :has_page_true, -> { where(has_page: true) }

  def duplicates_count
    Category.where(name: self.name).count + 1
  end

  def slug_candidates
    [
      :name,
      [:name, :duplicates_count]
    ]
  end

  def as_json(_options = {})
    {
      parent_id: parent_id,
      id: id,
      name: name,
      sorting: sorting,
      multiple_choice: multiple_choice,
      children: children.sorted.as_json,
      description: description,
      has_page: has_page,
      slug: slug
    }
  end
end
