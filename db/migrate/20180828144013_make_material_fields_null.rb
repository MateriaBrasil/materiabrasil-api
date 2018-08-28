# frozen_string_literal: true

class MakeMaterialFieldsNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :materials, :image_url, true
    change_column_null :materials, :technical_specification_url, true
  end
end
