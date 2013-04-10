class CreateWrittenLessons < ActiveRecord::Migration
  def change
    create_table :written_lessons do |t|
      t.string :title
      t.text :content
      t.string :image
      
      t.timestamps
    end
  end
end
