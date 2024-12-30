class Project < ApplicationRecord
  validates :content, presence: true

  after_create_commit { broadcast_append_to "projects" }
  after_update_commit { broadcast_replace_to "projects" }
  after_destroy_commit { broadcast_remove_to "projects" }

end
