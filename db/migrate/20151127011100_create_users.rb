class CreateUsers < ActiveRecord::Migration

  def up
    create_table :users do |t|
      # "create_table" is the migration method 
    	t.string "first_name", :limit => 25
    	t.string "last_name", :limit => 50
    	t.string "email", :default => "", :null => false
    	t.string "password", :limit => 40
      # t.string "first_name" is the short format
      # t.column "first_name", :string is the long format
      # options are :limit, :default, :null
      t.timestamps
    end
  end

  def down
  	drop_table :users
    # "drop_table" is the migration method
  end
  	
end
