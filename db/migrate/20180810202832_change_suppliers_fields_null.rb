# frozen_string_literal: true

class ChangeSuppliersFieldsNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:suppliers, :company_revenue, true)
    change_column_null(:suppliers, :number_of_employees, true)
  end
end
