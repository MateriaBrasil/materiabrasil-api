# frozen_string_literal: true

class AddPrivateToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :private, :boolean, default: false
  end
end
