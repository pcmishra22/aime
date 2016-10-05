class AddTypeToUser < ActiveRecord::Migration
  def change
    add_column :users, :type, :string
    remove_column :users, :role_id, :integer
    drop_table :roles
  end


  def down
    remove_column :users, :type, :string
  end
end
