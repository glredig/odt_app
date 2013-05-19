class ChangeMembershipUserIdType < ActiveRecord::Migration
  def up
  	change_column :memberships, :user_id, :integer
  end

  def down
  	change_column :memberships, :user_id, :string
  end
end
