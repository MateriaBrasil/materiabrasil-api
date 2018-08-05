# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength
class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def up
    rename_column :users, :name, :first_name
    add_column :users, :last_name, :string
    execute 'UPDATE users SET last_name = users.first_name'
    change_column_null(:users, :last_name, false)
    add_column :users, :image_url, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
    add_column :users, :newsletter, :boolean
    add_column :users, :bio, :text
    add_column :users, :company, :string
    add_column :users, :work_title, :string
    add_column :users, :website, :string
  end

  def down
    rename_column :users, :first_name, :name
    remove_column :users, :last_name, :string
    remove_column :users, :image_url, :string
    remove_column :users, :city, :string
    remove_column :users, :state, :string
    remove_column :users, :country, :string
    remove_column :users, :newsletter, :boolean
    remove_column :users, :bio, :text
    remove_column :users, :company, :string
    remove_column :users, :work_title, :string
    remove_column :users, :website, :string
  end
end
# rubocop:enable Metrics/MethodLength
