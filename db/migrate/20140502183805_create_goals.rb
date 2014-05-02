class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :body
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end
end
