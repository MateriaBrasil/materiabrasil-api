# frozen_string_literal: true

class AddTrigramExtension < ActiveRecord::Migration[5.2]
  def up
    execute 'create extension pg_trgm'
  end

  def down
    execute 'drop extension pg_trgm'
  end
end
