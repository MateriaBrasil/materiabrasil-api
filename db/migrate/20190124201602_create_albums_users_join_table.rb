# frozen_string_literal: true

class CreateAlbumsUsersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :albums, :users do |t|
      t.index :album_id
      t.index :user_id
    end
  end
end
