class AddCompletionColumnToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :completion, :boolean, default: false
  end
end
