# frozen_string_literal: true

class AddSortingToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :sorting, :integer
  end
end
