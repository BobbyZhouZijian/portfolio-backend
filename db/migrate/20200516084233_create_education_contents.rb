class CreateEducationContents < ActiveRecord::Migration[6.0]
  def change
    create_table :education_contents do |t|
      t.text :content
      t.belongs_to :education

      t.timestamps
    end
  end
end
