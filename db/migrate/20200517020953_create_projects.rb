class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :repo_link
      t.boolean :open_repo
      t.text :content

      t.timestamps
    end
  end
end
