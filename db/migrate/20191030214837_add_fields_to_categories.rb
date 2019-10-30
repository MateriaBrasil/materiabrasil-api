class AddFieldsToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :has_page, :boolean, default: false
    add_column :categories, :description, :text
  end
end
