# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength
class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :name, :first_name
    add_column :users, :last_name, :string, null: false, default: ''
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
end
# rubocop:enable Metrics/MethodLength
