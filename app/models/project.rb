class Project < ApplicationRecord
  after_create_commit  { broadcast_prepend_to "projects" }
  after_update_commit do
    broadcast_replace_later_to "projects", target: dom_id(self), partial: "projects/project", locals: { project: self }
  end
  after_destroy_commit  { broadcast_remove_to "projects" }

  validates :content, presence: true
end
