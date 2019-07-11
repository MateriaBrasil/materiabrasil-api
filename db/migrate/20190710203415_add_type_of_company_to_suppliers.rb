# frozen_string_literal: true

class AddTypeOfCompanyToSuppliers < ActiveRecord::Migration[5.2]
  def change
    add_column :suppliers, :type_of_company, :integer, default: 1
  end
end
