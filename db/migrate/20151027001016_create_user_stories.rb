class CreateUserStories < ActiveRecord::Migration
  def change
    create_table :user_stories do |t|
      t.string :name
      t.text :description
      t.integer :project_id
 t.references :projects, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
