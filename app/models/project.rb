class Project < ApplicationRecord
  validates :project_name, :repo_link, :open_repo, :content, presence: true
  scope :name_is, (lambda do |params|
    if params[:project_name].present?
      where('lower(project_name) LIKE ?', "%#{params[:project_name].downcase}%")
    end
  end)
end
