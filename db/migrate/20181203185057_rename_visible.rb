class RenameVisible < ActiveRecord::Migration[5.2]
  def change
    rename_column :materials, :visible, :published
  end
end
