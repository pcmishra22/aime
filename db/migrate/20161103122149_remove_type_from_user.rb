class RemoveTypeFromUser < ActiveRecord::Migration
  def change
  	remove_column :users, :type, :string
  end

  def down
    add_column :users, :type, :string
  end

end
