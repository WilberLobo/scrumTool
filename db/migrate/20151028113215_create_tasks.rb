class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :status
      t.integer :user_story_id
      t.integer :sprint_id
      t.integer :member_id
      t.integer :man_hours

      t.timestamps null: false
    end
  end
end
