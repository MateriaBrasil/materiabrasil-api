# frozen_string_literal: true

class AddImagesToMaterials < ActiveRecord::Migration[5.2]
  def change
    add_column :materials, :cover_image_url, :string
    add_column :materials, :highlight_image_url, :string
    add_column :materials, :list_image_url, :string
  end
end
