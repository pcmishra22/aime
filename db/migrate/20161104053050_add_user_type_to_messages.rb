class AddUserTypeToMessages < ActiveRecord::Migration
  def change
  	add_column :messages, :usertype, :string
  	add_column :mailboxes, :usertype, :string
  end

  def down
    remove_column :messages, :usertype, :string
    remove_column :mailboxes, :usertype, :string
  end

end
