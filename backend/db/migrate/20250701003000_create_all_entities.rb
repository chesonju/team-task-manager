# db/migrate/20250701003000_create_all_entities.rb
class CreateAllEntities < ActiveRecord::Migration[8.0]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.timestamps
    end

    create_table :departments do |t|
      t.string :name, null: false
      t.references :company, null: false, foreign_key: true
      t.timestamps
    end

    create_table :teams do |t|
      t.string :name, null: false
      t.references :department, null: false, foreign_key: true
      t.timestamps
    end

    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, index: { unique: true }
      t.string :password_digest, null: false
      t.references :team, null: false, foreign_key: true
      t.string :user_role, null: false
      t.timestamps
    end

    create_table :workspaces do |t|
      t.string :name, null: false
      t.timestamps
    end

    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.integer :status, default: 0, null: false
      t.integer :task_type, default: 0, null: false
      t.date :start_date
      t.date :due_date
      t.date :expected_end_date
      t.boolean :is_completed, default: false

      # 관계
      t.references :user, null: false, foreign_key: true          # 생성자
      t.references :assignee, null: false, foreign_key: { to_table: :users }
      t.references :reviewer, foreign_key: { to_table: :users }
      t.references :department, null: false, foreign_key: true
      t.references :workspace, null: false, foreign_key: true

      t.timestamps
    end
  end
end
