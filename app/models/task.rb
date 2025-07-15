class Task < ApplicationRecord
  belongs_to :project
  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks, dependent: :destroy
  validates :body, presence: true, length: { in: 3..3000 }

  after_create_commit  { broadcast_prepend_to "tasks" }
  after_update_commit { broadcast_replace_to "tasks" }
  after_destroy_commit  { broadcast_remove_to "tasks" }
end
