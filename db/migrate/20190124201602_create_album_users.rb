# frozen_string_literal: true

class CreateAlbumUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :album_users do |t|
      t.references :album, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
