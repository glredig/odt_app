class ChangeContentDataType < ActiveRecord::Migration
  def up
  	change_column :blogposts, :content, :text
  end

  def down
  	change_column :blogposts, :content, :string
  end
end
