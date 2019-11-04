class AddLabelToQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    add_column :questionnaires, :label, :text
  end
end
