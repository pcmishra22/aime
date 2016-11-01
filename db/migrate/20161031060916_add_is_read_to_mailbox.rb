class AddIsReadToMailbox < ActiveRecord::Migration
  def change
    add_column :mailboxes, :is_read, :boolean,default:false
    add_column :mailboxes, :parent_id, :integer,default:0,index:true
  end
end
