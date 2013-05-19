class CreateNewMemberships < ActiveRecord::Migration
  def change
  	create_table :memberships do |t|
  		t.integer :user_id
  		t.boolean :premium, default: false

  		t.timestamps
  	end
  end
end
