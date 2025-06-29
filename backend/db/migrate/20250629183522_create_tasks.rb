class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.references :assignee, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true
      t.references :reviewer, null: false, foreign_key: true
      t.integer :task_type
      t.integer :status
      t.date :expected_end_date
      t.date :due_date
      t.date :start_date
      t.boolean :is_completed

      t.timestamps
    end
  end
end
