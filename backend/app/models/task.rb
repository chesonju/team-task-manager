class Task < ApplicationRecord
  belongs_to :assignee, class_name: 'User'
  belongs_to :reviewer, class_name: 'User', optional: true
  belongs_to :department

  enum :status, { todo: 0, in_progress: 1, done: 2, review_pending: 3 }
  enum :task_type, { normal: 0, urgent: 1, bugfix: 2, meeting: 3 }
end
