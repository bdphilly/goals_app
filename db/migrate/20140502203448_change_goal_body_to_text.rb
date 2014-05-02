class ChangeGoalBodyToText < ActiveRecord::Migration
  def change
    change_column :goals, :body, :text
  end
end
