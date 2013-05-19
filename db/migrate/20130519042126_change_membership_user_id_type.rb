class RemoveMembershipUserId < ActiveRecord::Migration
  def up
  	remove_column :memberships, :user_id
  end

  def down
  	add_column :memberships, :user_id, :string
  end
end
