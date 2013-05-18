class CreateMemberships < ActiveRecord::Migration
  def change
  	create_table :memberships do |t|
  		t.string :user_id
  		t.boolean :premium, default: false

  		t.timestamps
  	end
  end
end
