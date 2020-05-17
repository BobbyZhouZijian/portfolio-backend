class Project < ApplicationRecord
  validates :project_name, :repo_link, :open_repo, :content, presence: true
end
