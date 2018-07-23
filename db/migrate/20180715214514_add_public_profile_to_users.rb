# frozen_string_literal: true

class AddPublicProfileToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :public_profile, :boolean, null: false, default: true
  end
end
