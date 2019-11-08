class AddSlugToMaterials < ActiveRecord::Migration[5.2]
  def change
    add_column :materials, :slug, :string
    add_index :materials, :slug, unique: true
  end
end
