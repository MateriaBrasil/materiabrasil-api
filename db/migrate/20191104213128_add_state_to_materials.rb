class AddStateToMaterials < ActiveRecord::Migration[5.2]
  def change
    add_column :materials, :state, :string
  end
end
