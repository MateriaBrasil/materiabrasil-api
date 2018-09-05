# frozen_string_literal: true

class CreateMaterialCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :material_categories do |t|
      t.references :material, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
