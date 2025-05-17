class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.boolean :done
      t.string :assigned_by
      t.datetime :assigned_at
      t.datetime :deadline

      t.timestamps
    end
  end
end
