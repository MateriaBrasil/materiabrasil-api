class AddSlugToSupplier < ActiveRecord::Migration[5.2]
  def change
    add_column :suppliers, :slug, :string
    add_index :suppliers, :slug, unique: true
  end
end
