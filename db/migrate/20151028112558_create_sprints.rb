class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.string :name
      t.integer :duration
      t.string :start_date
      t.string :end_date
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
