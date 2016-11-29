class CreateUsersTable < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :username
  		t.string :hash_pass
      t.timestamps
  	end
  end
end
