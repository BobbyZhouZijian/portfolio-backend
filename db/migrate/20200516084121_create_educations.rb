class CreateEducations < ActiveRecord::Migration[6.0]
  def change
    create_table :educations do |t|
      t.string :institution_name
      t.string :link
      t.string :degree

      t.timestamps
    end
  end
end
