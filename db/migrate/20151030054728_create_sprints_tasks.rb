class CreateSprintsTasks < ActiveRecord::Migration
  def change
    create_table :sprints_tasks, :id =>false do |t|
t.integer "sprint_id"
t.integer "page_id"
    end

add_index :sprints_tasks, ["sprint_id"	,"page_id"]
  end
end
