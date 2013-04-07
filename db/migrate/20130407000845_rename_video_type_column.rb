class RenameVideoTypeColumn < ActiveRecord::Migration
  def up
  	rename_column :videos, :type, :video_format
  end
end
