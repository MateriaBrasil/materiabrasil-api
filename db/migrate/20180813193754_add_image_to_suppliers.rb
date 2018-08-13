# frozen_string_literal: true

class AddImageToSuppliers < ActiveRecord::Migration[5.2]
  def change
    add_column :suppliers, :image_url, :string
  end
end
