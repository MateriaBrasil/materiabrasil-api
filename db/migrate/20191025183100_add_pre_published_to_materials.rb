class AddPrePublishedToMaterials < ActiveRecord::Migration[5.2]
  def change
    add_column :materials, :pre_published, :boolean, default: false
  end
end
