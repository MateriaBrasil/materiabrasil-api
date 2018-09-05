# frozen_string_literal: true

class AddCertificationUrl < ActiveRecord::Migration[5.2]
  def change
    add_column :materials, :certifications_url, :string
  end
end
