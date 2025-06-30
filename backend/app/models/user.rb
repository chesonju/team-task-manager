class User < ApplicationRecord
  has_secure_password

  belongs_to :team
  has_one :department, through: :team

  has_many :tasks

  has_many :assigned_tasks, class_name: 'Task', foreign_key: 'assignee_id'
  has_many :reviewed_tasks, class_name: 'Task', foreign_key: 'reviewer_id'

  enum :user_role, { member: 0, reviewer: 1, admin: 2 }
end
