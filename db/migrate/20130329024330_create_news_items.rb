class CreateNewsItems < ActiveRecord::Migration
  def change
    create_table :news_items do |t|
      t.string :title
      t.text :content
      t.integer :user_id

      t.timestamps
    end
    add_index :news_items, [:user_id, :created_at]
  end
end
